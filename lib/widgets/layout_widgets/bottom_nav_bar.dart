import 'package:flutter/material.dart';
import 'package:sample_app/themes/theme_config.dart';

import '../../routes/route_names.dart';
import '../button_widgets/button_icon.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final lightTheme = [
    '/$shopRoute',
    '/$userRoute',
    '/$messageRoute',
  ];

  BottomBarTheme theme = BottomBarTheme.init();

  _getBottomBarTheme() {
    if (lightTheme.contains(currentRoute)) {
      theme = BottomBarTheme.light();
    } else {
      theme = BottomBarTheme.dark();
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 50), () {
      _getBottomBarTheme();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: theme.backgroudColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, bottomPadding),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavBarItem(
                    theme: theme,
                    title: 'Home',
                    icon: Icons.home,
                    outlineIcon: Icons.home_outlined,
                    routes: const [
                      '/$homeRoute',
                      initialRoute,
                      '/$feedRoute',
                    ],
                    onTap: () {
                      context.go('/$feedRoute');
                    },
                  ),
                  BottomNavBarItem(
                    theme: theme,
                    title: 'Shop',
                    icon: Icons.shopping_bag,
                    outlineIcon: Icons.shopping_bag_outlined,
                    routes: const [
                      '/$shopRoute',
                    ],
                    onTap: () {
                      setState(() {
                        context.go('/$shopRoute');
                      });
                    },
                  ),
                  BottomNavBarItem(
                    theme: theme,
                    title: 'Friends',
                    icon: Icons.people,
                    outlineIcon: Icons.people_outline,
                    routes: const [
                      '/$friendsRoute',
                    ],
                    onTap: () {
                      setState(() {
                        context.go('/$friendsRoute');
                      });
                    },
                  ),
                  BottomNavBarItem(
                    theme: theme,
                    title: 'User',
                    icon: Icons.person,
                    outlineIcon: Icons.person_outline,
                    routes: const [
                      '/$userRoute',
                    ],
                    onTap: () {
                      setState(() {
                        context.go('/$userRoute');
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarTheme {
  final Color backgroudColor;
  final Color iconSelectedColor;
  final TextStyle textSelectedStyle;
  final Color iconUnselectColor;
  final TextStyle textUnselectStyle;
  BottomBarTheme({
    required this.backgroudColor,
    required this.iconSelectedColor,
    required this.textSelectedStyle,
    required this.iconUnselectColor,
    required this.textUnselectStyle,
  });
  static BottomBarTheme init() {
    return BottomBarTheme(
      backgroudColor: ColorPalettes.g500,
      iconSelectedColor: ColorPalettes.transparent,
      textSelectedStyle: CustomTextStyle.boldSub(
        color: ColorPalettes.transparent,
      ),
      iconUnselectColor: ColorPalettes.transparent,
      textUnselectStyle: CustomTextStyle.mediumSub(
        color: ColorPalettes.transparent,
      ),
    );
  }

  static BottomBarTheme light() {
    return BottomBarTheme(
      backgroudColor: Colors.white,
      iconSelectedColor: TextColors.iconHighEm,
      textSelectedStyle: CustomTextStyle.boldSub(
        color: TextColors.textHighEm,
      ),
      iconUnselectColor: TextColors.iconMedEm,
      textUnselectStyle: CustomTextStyle.mediumSub(
        color: TextColors.iconMedEm,
      ),
    );
  }

  static BottomBarTheme dark() {
    return BottomBarTheme(
      backgroudColor: Colors.black,
      iconSelectedColor: TextColors.textWhite,
      textSelectedStyle: CustomTextStyle.boldSub(
        color: TextColors.textWhite,
      ),
      iconUnselectColor: TextColors.iconMedEm,
      textUnselectStyle: CustomTextStyle.mediumSub(
        color: TextColors.iconMedEm,
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final IconData? outlineIcon;
  final List<String> routes;
  final Function()? onTap;
  final BottomBarTheme theme;
  const BottomNavBarItem({
    super.key,
    required this.title,
    this.icon,
    this.outlineIcon,
    required this.routes,
    this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = routes.contains(currentRoute);

    return ButtonIcon(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            Icon(
              isActive ? icon : outlineIcon,
              color:
                  isActive ? theme.iconSelectedColor : theme.iconUnselectColor,
              size: 24,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                title,
                style: isActive
                    ? theme.textSelectedStyle
                    : theme.textUnselectStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
