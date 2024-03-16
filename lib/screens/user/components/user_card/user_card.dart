import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../apis/user/user.dart';
import '../../../../themes/theme_config.dart';
import 'dynamic_ink_well.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    required this.size,
    super.key,
  });

  final UserModel user;
  final double size;

  int stringToHexInt(String value) {
    String c = (_hash(value) & 0x00FFFFFF).toRadixString(16).toUpperCase();
    String hex = "FF00000".substring(0, 8 - c.length) + c;
    return int.parse(hex, radix: 16);
  }

  int _hash(String value) {
    int hash = 0;
    for (var code in value.runes) {
      hash = code + ((hash << 5) - hash);
    }
    return hash;
  }

  @override
  Widget build(BuildContext context) {
    final estimatedColor = Color(stringToHexInt(user.eyeColor.toLowerCase()));
    final cardRotateAngle = -pi / 10 * size;
    final userFullName = '${user.lastName} ${user.firstName}';
    return Stack(
      children: [
        DynamicInkWell(
          onTap: () {},
          child: (tappedDown) => Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(cardRotateAngle),
            child: Stack(
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: '${user.id}color',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 48, 0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color: estimatedColor,
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 16, 48, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            userFullName,
                            style: CustomTextStyle.boldH6(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 54,
                  top: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: size * 200 + 8,
          bottom: 0,
          child: DynamicInkWell(
            onTap: () {},
            child: (tappedDown) {
              return Hero(
                transitionOnUserGestures: true,
                tag: '${user.id}image',
                flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  if (flightDirection == HeroFlightDirection.pop) {
                    return RotationTransition(
                      turns: const AlwaysStoppedAnimation(-15 / 360),
                      child: fromHeroContext.widget,
                    );
                  } else {
                    return toHeroContext.widget;
                  }
                },
                child: Material(
                  color: Colors.transparent,
                  child: AnimatedScale(
                    scale: tappedDown ? 0.8 : 1.0,
                    duration: const Duration(milliseconds: 100),
                    child: Image.network(
                      user.image,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
