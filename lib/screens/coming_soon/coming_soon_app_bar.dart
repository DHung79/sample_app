import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/route_names.dart';
import '../../themes/theme_config.dart';

class ComingSoonAppBar extends StatelessWidget {
  final String? title;
  const ComingSoonAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    const String goToHomeRoute = '/$homeRoute';
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blueAccent,
      flexibleSpace: Padding(
        padding: EdgeInsets.fromLTRB(8, statusBarHeight + 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _appBarButton(
              icon: Icons.home,
              ontap: () {
                //change screen using route
                final currentRoute = GoRouter.of(context)
                    .routerDelegate
                    .currentConfiguration
                    .uri
                    .toString();
                if (currentRoute != goToHomeRoute) {
                  context.go(
                    goToHomeRoute,
                  );
                } else {
                  context.pop();
                }
              },
            ),
            Text(
              title ?? 'Sample App',
              style: GGTextStyles.h2Bold(
                color: TextColors.textWhite,
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
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Icon(
            icon,
            color: visionable ? TextColors.textWhite : Colors.transparent,
            size: 32,
          ),
        ),
      ),
    );
  }
}
