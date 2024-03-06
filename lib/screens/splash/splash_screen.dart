import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/routes/route_names.dart';
import '../../themes/theme_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
    final currentRoute =
        GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    if (currentRoute == initialRoute) {
      Timer(const Duration(milliseconds: 2500), () {
        context.go(
          '/$homeRoute',
        );
        _controller?.dispose();
        _controller = null;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: _controller != null
              ? AnimatedBuilder(
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
                )
              : Container(),
        ),
      ),
    );
  }
}
