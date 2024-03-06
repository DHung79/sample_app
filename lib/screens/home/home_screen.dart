import 'package:flutter/material.dart';
import 'package:sample_app/themes/theme_config.dart';

import '../../apis/user/user.dart';
import 'home_app_bar.dart';
import 'user_detail/user_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userBloc = UserBloc();
  final _scrollController = ScrollController();
  int limit = 20;
  int maxPage = 1;
  int currentPage = 1;
  final _users = <UserModel>[];

  @override
  void initState() {
    _fetchDataOnPage(1);
    _scrollController.addListener(_scrollListener);
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
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (currentPage < maxPage) {
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
        child: HomeAppBar(),
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
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
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
              double itemWidth = 200;
              double itemHeight = 250;
              final screenWidth = MediaQuery.of(context).size.width;
              final maxColumnCount = (screenWidth / itemWidth).floor();
              return GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: _users.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: maxColumnCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return InkWell(
                    onTap: () {
                      NavigatorStyle.navigatorTo(
                        context: context,
                        transitionDuration: 350,
                        toScreen: UserDetailScreen(user: user),
                      );
                    },
                    child: Hero(
                      tag: user.id,
                      child: Container(
                        width: itemWidth,
                        height: itemHeight,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadowStyle.e01,
                          ],
                          color: Colors.lightBlueAccent.shade200,
                        ),
                        child: Image.network(user.image),
                      ),
                    ),
                  );
                },
              );
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
          }),
    );
  }
}
