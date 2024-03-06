import 'package:flutter/material.dart';
import '../../../themes/theme_config.dart';

class UserDetailAppBar extends StatelessWidget {
  const UserDetailAppBar({super.key});

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
              icon: Icons.arrow_back_ios_new_rounded,
              ontap: () {
                //change screen using route
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Info',
                    style: GGTextStyles.h2Bold(
                      color: TextColors.textWhite,
                    ),
                  ),
                ],
              ),
            ),
            _appBarButton(visionable: false),
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
            icon ?? Icons.navigate_next_sharp,
            color: visionable ? TextColors.textWhite : Colors.transparent,
            size: 32,
          ),
        ),
      ),
    );
  }
}
