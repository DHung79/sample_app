import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/route_names.dart';
import '../../themes/theme_config.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/layout_widget.dart';
import 'components/viettel_post.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CustomAppBar(
          child: _appBar(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              CustomButtonStyle.roundDark(
                child: Text(
                  'Viettel Post API',
                  style: CustomTextStyle.boldStandard(
                    color: TextColors.textWhite,
                  ),
                ),
                onPressed: () {
                  NavigatorStyle.navigatorTo(
                    context: context,
                    transitionDuration: 350,
                    tween: NavigatorStyle.pushRight,
                    toScreen: LayoutWidget(
                      appBar: AppBar(),
                      body: const ViettelPost(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtonStyle.roundDark(
                child: Text(
                  'GHTK API',
                  style: CustomTextStyle.boldStandard(
                    color: TextColors.textWhite,
                  ),
                ),
                onPressed: () {
                  NavigatorStyle.navigatorTo(
                    context: context,
                    transitionDuration: 350,
                    tween: NavigatorStyle.pushRight,
                    toScreen: LayoutWidget(
                      appBar: AppBar(),
                      body: Container(),
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

  Widget _appBar(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Padding(
      padding: EdgeInsets.fromLTRB(8, statusBarHeight + 8, 8, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _appBarButton(
            child: Icon(
              Icons.home,
              color: TextColors.textWhite,
              size: 32,
            ),
            onTap: () {
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
                  'Shipping',
                  style: GGTextStyle.h2Bold(
                    color: TextColors.textWhite,
                  ),
                ),
              ],
            ),
          ),
          _appBarButton(
            visible: false,
            child: const Icon(
              Icons.home,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarButton({
    required Widget child,
    Function()? onTap,
    bool visible = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: visible ? 1 : 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: child,
        ),
      ),
    );
  }
}
