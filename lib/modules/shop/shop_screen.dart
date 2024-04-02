import 'package:flutter/material.dart';
import '../../widgets/layout_widgets/layout_scaffold.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Text('Shop'),
          ],
        ),
      ),
    );
  }
}
