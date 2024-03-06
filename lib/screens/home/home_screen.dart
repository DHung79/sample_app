import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/routes/route_names.dart';

import '../../themes/theme_config.dart';
import 'components/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorPalettes.nWhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: HomeAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _navigaterButton(
                  name: 'List User Sample',
                  onPressed: () {
                    context.go('/$userRoute');
                  },
                ),
                _navigaterButton(
                  name: 'Feed Sample',
                  onPressed: () {
                    context.go('/$feedRoute');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigaterButton({
    Function()? onPressed,
    required String name,
  }) {
    return CustomButtonStyle.roundDark(
      color: Colors.blueAccent,
      onPressed: onPressed,
      child: Text(
        name,
        style: CustomTextStyle.boldStandard(
          color: TextColors.textWhite,
        ),
      ),
    );
  }
}
