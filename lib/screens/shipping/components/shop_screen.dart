import 'package:flutter/material.dart';
import '../../../themes/theme_config.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadowStyle.e01,
            ],
          ),
        );
      },
    );
  }
}
