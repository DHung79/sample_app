import 'package:flutter/material.dart';
import '../../../../themes/theme_config.dart';

class UserInfo {
  static Widget userInfo({
    required String title,
    String? contentText,
    Widget? customContent,
  }) {
    return Wrap(
      children: [
        Text(
          title,
          style: CustomTextStyle.boldH6(
            color: TextColors.textWhite,
          ).copyWith(
              shadows: [
                BoxShadowStyle.widgetShadow,
              ],
            ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 16, 0),
          child: Text(
            ':',
            style: CustomTextStyle.boldH6(
              color: TextColors.textWhite,
            ),
          ),
        ),
        if (contentText != null)
          Text(
            contentText,
            style: CustomTextStyle.mediumH6(
              color: TextColors.textWhite,
            ),
          ),
        if (customContent != null) customContent,
      ],
    );
  }

  static Widget userGender(String gender) {
    IconData? icon;
    Color? iconColor;
    if (gender.toLowerCase() == 'male') {
      icon = Icons.male_rounded;
      iconColor = Colors.blue.shade300;
    } else {
      icon = Icons.female_rounded;
      iconColor = Colors.pink.shade300;
    }
    return Icon(
      icon,
      size: 35,
      color: iconColor,
      shadows: [
        BoxShadowStyle.widgetShadow,
      ],
    );
  }
}
