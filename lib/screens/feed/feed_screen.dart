import 'package:flutter/material.dart';
import '../../themes/theme_config.dart';
import 'components/app_bar.dart';
import 'components/feed_player/feed_player.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: FeedAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              _navigaterButton(
                name: 'Slider Video',
                onPressed: () {
                  NavigatorStyle.navigatorTo(
                    context: context,
                    transitionDuration: 350,
                    tween: NavigatorStyle.pushRight,
                    toScreen: _layoutWidget(
                      appBarTitle: 'Slider Video',
                      child: const FeedPlayer(),
                    ),
                  );
                },
              ),
              _navigaterButton(
                name: 'Content Video',
                onPressed: () {
                  NavigatorStyle.navigatorTo(
                    context: context,
                    transitionDuration: 350,
                    tween: NavigatorStyle.pushRight,
                    toScreen: _layoutWidget(
                      appBarTitle: 'Content Video',
                      child: const FeedPlayer(
                        isSlider: false,
                      ),
                    ),
                  );
                },
              ),
            ],
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
        color: Colors.blueAccent,
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

  Widget _layoutWidget({
    required String appBarTitle,
    required Widget child,
  }) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: FeedAppBar(
          title: appBarTitle,
        ),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
