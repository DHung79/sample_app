import 'package:flutter/material.dart';
import '../../routes/route_names.dart';
import '../../themes/theme_config.dart';
import '../../widgets/layout_widgets/layout_app_bar.dart';
import '../../widgets/layout_widgets/layout_scaffold.dart';
import 'components/bank_dialog.dart';
import 'pages/translate_img_screen.dart';
import 'pages/translate_ocr_screen.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: LayoutAppBar(
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
                  'Banks Dialog',
                  style: CustomTextStyle.boldStandard(
                    color: TextColors.textWhite,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierColor: Colors.black12,
                    builder: (BuildContext context) {
                      return const BankDialog();
                    },
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtonStyle.roundDark(
                child: Text(
                  'Translate Image',
                  style: CustomTextStyle.boldStandard(
                    color: TextColors.textWhite,
                  ),
                ),
                onPressed: () {
                  NavigatorStyle.slideNavigator(
                    context: context,
                    transitionDuration: 350,
                    tween: NavigatorStyle.pushRight,
                    toScreen: const LayoutScaffold(
                      body: SafeArea(
                        child: TranslateImgScreen(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtonStyle.roundDark(
                child: Text(
                  'Translate OCR',
                  style: CustomTextStyle.boldStandard(
                    color: TextColors.textWhite,
                  ),
                ),
                onPressed: () {
                  NavigatorStyle.slideNavigator(
                    context: context,
                    transitionDuration: 350,
                    tween: NavigatorStyle.pushRight,
                    toScreen: const LayoutScaffold(
                      body: SafeArea(
                        child: TranslateOCRScreen(),
                      ),
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
                  'Translate',
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
