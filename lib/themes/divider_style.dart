import 'package:flutter/material.dart';
import 'theme_config.dart';

class DividerStyle {
  static Widget or() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 61,
          color: OutlineColors.med,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Hoặc',
            style: CustomTextStyle.mediumBody(color: TextColors.textLowEm),
          ),
        ),
        Container(
          height: 1,
          width: 61,
          color: OutlineColors.med,
        ),
      ],
    );
  }
}
