import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../routes/route_names.dart';
import '../../widgets/layout_widgets/layout_scaffold.dart';
import 'pages/feed_player/app_bar.dart';
import 'pages/feed_player/feed_player.dart';
import '../../themes/theme_config.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _sliderPlayer(context);
    // return Scaffold(
    //   resizeToAvoidBottomInset: true,
    //   backgroundColor: Colors.white,
    //   appBar: PreferredSize(
    //     preferredSize: const Size.fromHeight(80.0),
    //     child: _appBar(context),
    //   ),
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    //       child: Column(
    //         children: [
    //           _navigaterButton(
    //             name: 'Slider Video',
    //             onPressed: () {
    //               NavigatorStyle.slideNavigator(
    //                 context: context,
    //                 transitionDuration: 350,
    //                 tween: NavigatorStyle.pushRight,
    //                 toScreen: _sliderPlayer(context),
    //               );
    //             },
    //           ),
    //           _navigaterButton(
    //             name: 'Content Video',
    //             onPressed: () {
    //               NavigatorStyle.slideNavigator(
    //                 context: context,
    //                 transitionDuration: 350,
    //                 tween: NavigatorStyle.pushRight,
    //                 toScreen: _contentPlayer(),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  AppBar _appBar(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blueAccent,
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: Colors.blueAccent,
      //   systemNavigationBarColor: Colors.blueAccent,
      // ),
      flexibleSpace: Padding(
        padding: EdgeInsets.fromLTRB(8, statusBarHeight + 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _appBarButton(
              icon: Icons.home,
              ontap: () {
                context.go(
                  '/$homeRoute',
                );
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Feed Screen',
                    style: GGTextStyle.h2Bold(
                      color: TextColors.textWhite,
                    ),
                  ),
                ],
              ),
            ),
            _appBarButton(
              visionable: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBarButton({
    Function()? ontap,
    IconData? icon,
    Decoration? decoration,
    bool visionable = true,
  }) {
    return Opacity(
      opacity: visionable ? 1 : 0,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: decoration,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Icon(
              icon ?? Icons.navigate_next_sharp,
              color: TextColors.textWhite,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigaterButton({
    Function()? onPressed,
    required String name,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
      child: CustomButtonStyle.roundDark(
        color: Colors.deepPurpleAccent,
        onPressed: onPressed,
        child: Text(
          name,
          style: CustomTextStyle.boldStandard(
            color: TextColors.textWhite,
          ),
        ),
      ),
    );
  }

  Widget _sliderPlayer(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final playerHeight =
        screenSize.height - screenPadding.top - screenPadding.bottom - 70;
    return LayoutScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: playerHeight,
              child: const FeedPlayer(),
            ),
            const FeedPlayerAppBar(
              title: 'Slider Video',
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentPlayer() {
    return const LayoutScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            FeedPlayerAppBar(
              title: 'Content Video',
            ),
            Expanded(
              child: FeedPlayer(
                isSlider: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
