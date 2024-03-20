import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../apis/user/user.dart';
import '../../../../themes/theme_config.dart';
import '../../../../widgets/img_from_url.dart';
import '../user_detail/user_detail_screen.dart';
import 'dynamic_ink_well.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    required this.size,
    super.key,
  });

  final UserModel user;
  final double size;

  @override
  Widget build(BuildContext context) {
    final estimatedColor = Color(stringToHexInt(user.eyeColor.toLowerCase()));
    final cardRotateAngle = -pi / 10 * size;
    final userFullName = '${user.lastName} ${user.firstName}';
    var sizePosition = size.clamp(0, 0.25);
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
        Positioned.fill(
          right: sizePosition * 250 + 8,
          bottom: sizePosition * 150,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DynamicInkWell(
              onTap: () {
                NavigatorStyle.fadeNavigator(
                  context: context,
                  transitionDuration: 350,
                  toScreen: UserDetailScreen(user: user),
                );
              },
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
                      return ScaleTransition(
                        scale: const AlwaysStoppedAnimation(0.85),
                        child: fromHeroContext.widget,
                      );
                    } else {
                      return toHeroContext.widget;
                    }
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: AnimatedScale(
                      scale: tappedDown ? 0.85 : 1.0,
                      duration: const Duration(milliseconds: 100),
                      child: ImgFromUrl(
                        url: user.image,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
