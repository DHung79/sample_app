import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/route_names.dart';
import '../../../themes/theme_config.dart';

class FeedAppBar extends StatelessWidget {
  final String title;
  const FeedAppBar({
    super.key,
    this.title = 'Feed',
  });

  @override
  Widget build(BuildContext context) {
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
                    title,
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
}
