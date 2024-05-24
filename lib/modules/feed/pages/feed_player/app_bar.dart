import 'package:flutter/material.dart';

import 'package:sample_app/routes/route_names.dart';

import '../../../../themes/theme_config.dart';

class FeedPlayerAppBar extends StatelessWidget {
  final String title;
  const FeedPlayerAppBar({
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, statusBarHeight + 8, 8, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _appBarButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () {
                  context.go(homeRoute);
                },
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GGTextStyle.h2Bold(
                        color: ColorPalettes.white100,
                      ).copyWith(
                        shadows: [BoxShadowStyle.e01],
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
      ],
    );
  }

  Widget _appBarButton({
    Function()? onTap,
    IconData? icon,
    Decoration? decoration,
    bool visionable = true,
  }) {
    return Opacity(
      opacity: visionable ? 1 : 0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: decoration,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Icon(
              icon ?? Icons.navigate_next_sharp,
              color: ColorPalettes.white100,
              size: 32,
              shadows: [BoxShadowStyle.e01],
            ),
          ),
        ),
      ),
    );
  }
}
