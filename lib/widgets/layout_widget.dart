import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  final Widget appBar;
  final Widget body;
  const LayoutWidget({
    super.key,
    required this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: appBar,
      ),
      body: body,
    );
  }
}
