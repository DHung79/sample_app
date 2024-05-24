import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../themes/theme_config.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2250),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      Timer(const Duration(milliseconds: 2500), () {
        _controller?.dispose();
        _controller = null;
        setState(() {});
      });
    }

    return _controller == null
        ? const HomeScreen()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller!,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller!.value * pi,
                      child: child,
                    );
                  },
                  child: Image(
                    image: AssetImage(ImgAssets.splash),
                    height: 150,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          );
  }
}
