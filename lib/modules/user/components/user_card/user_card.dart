import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../apis/database/user/user.dart';
import '../../../../themes/theme_config.dart';
import '../../../../widgets/image_widgets/img_from_url.dart';
import '../user_detail/user_detail_screen.dart';
import 'dynamic_ink_well.dart';
import 'user_info.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
    required this.size,
  }) : super(key: key);

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
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color: estimatedColor,
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                userFullName,
                                style: CustomTextStyle.boldH6(
                                  color: Colors.white,
                                ).copyWith(
                                  shadows: [
                                    BoxShadowStyle.widgetShadow,
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              UserInfo.userGender(user.gender),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
                              child: ImgFromUrl(
                                url: user.image,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                            child: Row(
                              children: [
                                Text(
                                  user.age.toString(),
                                  style: CustomTextStyle.boldH6(
                                    color: TextColors.textWhite,
                                  ).copyWith(
                                    shadows: [
                                      BoxShadowStyle.widgetShadow,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
