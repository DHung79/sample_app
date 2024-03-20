import 'package:flutter/material.dart';
import '../../apis/user/user.dart';
import '../../themes/theme_config.dart';
import 'components/app_bar.dart';
import 'components/user_card/user_card.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _userBloc = UserBloc();
  final _scrollController = ScrollController();
  int limit = 10;
  int maxPage = 1;
  int currentPage = 1;
  final _users = <UserModel>[];
  final PageController _pageController = PageController(viewportFraction: 0.8);
  var _currentIndex = 0;

  @override
  void initState() {
    _fetchDataOnPage(1);
    _pageController.addListener(_scrollListener);
    // _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _fetchDataOnPage(int page) {
    Map<String, dynamic> params = {
      'limit': limit,
      'skip': (page - 1) * limit,
    };
    _userBloc.fetchAllData(
      params: params,
    );
  }

  _scrollListener() {
    if (currentPage < maxPage) {
      // if (_scrollController.position.extentAfter < 200) {
      if (_users.length - _pageController.page!.ceil() < 3) {
        currentPage += 1;
        _fetchDataOnPage(currentPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorPalettes.nWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: UserAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
      child: StreamBuilder(
        stream: _userBloc.allData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            maxPage = snapshot.data!.model!.total ~/ limit;
            currentPage = snapshot.data!.model!.skip ~/ limit + 1;
            final users = snapshot.data!.model!.records;
            for (var user in users) {
              if (_users.where((e) => e.id == user.id).isEmpty) {
                _users.add(user);
              }
            }
            return _pageView();
          } else if (snapshot.hasError) {
            final error = snapshot.error.toString();
            return Text(
              error,
              style: CustomTextStyle.boldBody(
                color: TextColors.error,
              ),
            );
          } else {
            return const IndicatorStyle();
          }
        },
      ),
    );
  }

  Widget _pageView() {
    // final screenSize = MediaQuery.of(context).size;
    // final itemWidth = screenSize.width - 80;
    return SizedBox(
      height: 400,
      child: PageView.builder(
        itemCount: _users.length,
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final user = _users[index];
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double size = 0;
              if (_pageController.position.haveDimensions) {
                size = (_pageController.page ?? 0) - index;
                if (size >= 0) {
                  size = (size.clamp(-1, 1).toDouble()).abs();
                } else {
                  size = 0;
                }
              }
              if (index != _currentIndex && size == 1) {
                return const SizedBox.shrink();
              }

              return Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..rotateY(_currentIndex == index ? 0 : 120 / 360),
                child: UserCard(
                  user: user,
                  size: size,
                ),
              );
            },
          );
        },
      ),
    );
  }

 
}
