import 'package:flutter/material.dart';

import '../../themes/theme_config.dart';
import '../button_widgets/button_icon.dart';

class BottomNavBar extends StatefulWidget {
  final List<BottomNavBarItem> tabs;
  final double height;
  const BottomNavBar({
    Key? key,
    required this.tabs,
    this.height = 70,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final backgroudColor =
        widget.tabs[_tabController.index].theme.backgroudColor;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: backgroudColor,
        boxShadow: [BoxShadowStyle.bottomSheet],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, bottomPadding),
        child: Column(
          children: [
            SizedBox(
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var tab in widget.tabs)
                    BottomBarItemWidget(
                      item: tab,
                      isActive:
                          _tabController.index == widget.tabs.indexOf(tab),
                      onTap: () {
                        setState(() {
                          _tabController.index = widget.tabs.indexOf(tab);
                          tab.onTap();
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

class BottomBarItemWidget extends StatelessWidget {
  final BottomNavBarItem item;
  final bool isActive;
  final Function() onTap;
  const BottomBarItemWidget({
    Key? key,
    required this.item,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = item.theme;
    final buttonIcon = isActive ? item.icon : item.outlineIcon;
    final buttonIconColor =
        isActive ? theme.iconSelectedColor : theme.iconUnselectColor;
    final buttonTextStyle =
        isActive ? theme.textSelectedStyle : theme.textUnselectStyle;
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      child: ButtonIcon(
        key: ValueKey(isActive),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            children: [
              Icon(
                buttonIcon,
                color: buttonIconColor,
                size: 24,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: Text(
                  item.title,
                  style: buttonTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
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
      iconSelectedColor: ColorPalettes.oGreen3,
      textSelectedStyle: CustomTextStyle.boldSub(
        color: ColorPalettes.oGreen3,
      ),
      iconUnselectColor: ColorPalettes.oGreen3,
      textUnselectStyle: CustomTextStyle.mediumSub(
        color: ColorPalettes.oGreen3,
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

class BottomNavBarItem {
  final BottomBarTheme theme;
  final String title;
  final IconData? icon;
  final IconData? outlineIcon;
  final Function() onTap;

  BottomNavBarItem({
    required this.theme,
    required this.title,
    this.icon,
    this.outlineIcon,
    required this.onTap,
  });
}
