import 'package:flutter/material.dart';

import '../../themes/theme_config.dart';
import 'components/app_bar.dart';

class ComingSoonScreen extends StatelessWidget {
  final String? appBarTitle;
  const ComingSoonScreen({
    super.key,
    this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    const mysteryBoxImg =
        'https://voyager.gener8ads.com/assets/img/marketplace/mystery-box-402fd83a8ad4efe07563b62f19493621.gif';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorPalettes.nWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: ComingSoonAppBar(
          title: appBarTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ImgFromUrl(
                width: 500,
                height: 400,
                url: mysteryBoxImg,
              ),
              Text(
                appBarTitle ?? 'Coming Soon',
                style: GGTextStyle.h2Bold(
                  color: TextColors.textHighEm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
