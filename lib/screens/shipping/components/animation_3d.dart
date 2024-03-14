import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:sample_app/themes/theme_config.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

const widthAndHeight = 100.0;

class Animation3D extends StatefulWidget {
  const Animation3D({super.key});

  @override
  State<Animation3D> createState() => _Animation3DState();
}

class _Animation3DState extends State<Animation3D>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;
  static const angleValue = 1 / 360;
  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    // _zController
    //   ..reset()
    //   ..repeat();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: widthAndHeight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                _xController,
                _yController,
                _zController,
              ]),
              builder: (context, child) {
                logDebug(
                    ' _xController: ${_xController.value} \n _yController: ${_yController.value} \n _zController: ${_zController.value}');
                final x1 = (_xController.value >= 0 * angleValue &&
                    _xController.value < 90 * angleValue);
                final x2 = (_xController.value >= 90 * angleValue &&
                    _xController.value < 180 * angleValue);
                final x3 = (_xController.value >= 180 * angleValue &&
                    _xController.value < 270 * angleValue);
                final x4 = (_xController.value >= 270 * angleValue &&
                    _xController.value <= 360 * angleValue);
                final y1 = (_yController.value >= 0 * angleValue &&
                    _yController.value < 90 * angleValue);
                final y2 = (_yController.value >= 90 * angleValue &&
                    _yController.value < 180 * angleValue);
                final y3 = (_yController.value >= 180 * angleValue &&
                    _yController.value < 270 * angleValue);
                final y4 = (_yController.value >= 270 * angleValue &&
                    _yController.value <= 360 * angleValue);
                final z1 = (_zController.value >= 0 * angleValue &&
                    _zController.value < 90 * angleValue);
                final z2 = (_zController.value >= 90 * angleValue &&
                    _zController.value < 180 * angleValue);
                final z3 = (_zController.value >= 180 * angleValue &&
                    _zController.value < 270 * angleValue);
                final z4 = (_zController.value >= 270 * angleValue &&
                    _zController.value <= 360 * angleValue);

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.green.shade100,
                        width: widthAndHeight,
                        height: widthAndHeight,
                      ),
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2.0),
                        child: Container(
                          color: Colors.red.shade100,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2.0),
                        child: Container(
                          color: Colors.blue.shade100,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      // back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(Vector3(0, 0, -widthAndHeight)),
                        child: Container(
                          color: Colors.purple.shade100,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      // left side
                      if ((x1 && y1) || (x2 && y4) || (x3 && y1))
                        Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()..rotateY(pi / 2.0),
                          child: Container(
                            color: Colors.red,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                      if ((x1 && (y2 || y3 || y4)) ||
                          (x2 && (y1 || y3)) ||
                          (x4 && y2))
                        Container(
                          color: Colors.green.shade300,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      // right side
                      if ((x1 && (y3 || y4)) ||
                          (x2 && y1) ||
                          (x2 && (y1 || y2)) ||
                          x3 && (y2) ||
                          (x4 && y3))
                        Transform(
                          alignment: Alignment.centerRight,
                          transform: Matrix4.identity()..rotateY(-pi / 2.0),
                          child: Container(
                            color: Colors.blue,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                      // front
                      if ((x1 && y1) ||
                          (x2 && (y2 || y4)) ||
                          (x3 && (y1 || y2)) ||
                          (x4 && y4))
                        Container(
                          color: Colors.green,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      // top side
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2.0),
                        child: Container(
                          color: Colors.orange,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      // bottom side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2.0),
                        child: Container(
                          color: Colors.brown,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
