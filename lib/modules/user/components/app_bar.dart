import 'package:flutter/material.dart';
import 'package:sample_app/modules/coming_soon/coming_soon_screen.dart';
import '../../../routes/route_names.dart';
import '../../../themes/theme_config.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blueAccent,
      flexibleSpace: Padding(
        padding: EdgeInsets.fromLTRB(8, statusBarHeight + 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _appBarButton(
              icon: Icons.home,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: TextColors.textWhite,
              //     width: 2,
              //   ),
              //   shape: BoxShape.circle,
              // ),
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
                    'Dummy Json Api',
                    style: GGTextStyle.h2Bold(
                      color: TextColors.textWhite,
                    ),
                  ),
                ],
              ),
            ),
            _appBarButton(
              ontap: () {
                //change screen using navigator
                NavigatorStyle.slideNavigator(
                  context: context,
                  transitionDuration: 350,
                  tween: NavigatorStyle.pushRight,
                  toScreen: const ComingSoonScreen(),
                );
              },
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
  }) {
    return GestureDetector(
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
    );
  }
}
