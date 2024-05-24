import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../themes/theme_config.dart';

class ImgFromUrl extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final Widget? placeholder;
  final double? width;
  final double? height;
  final int? duration;
  const ImgFromUrl({
    Key? key,
    required this.url,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.width,
    this.height,
    this.duration,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final transitionDuration = Duration(milliseconds: duration ?? 1);
    return CachedNetworkImage(
      width: width,
      height: height,
      fadeInDuration: transitionDuration,
      fadeOutDuration: transitionDuration,
      placeholderFadeInDuration: transitionDuration,
      fit: fit,
      imageUrl: url,
      placeholder: (context, url) {
        return placeholder ??
            Center(
              child: Image(
                width: width,
                height: height,
                image: AssetImage(ImgAssets.placeholder),
              ),
            );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Opacity(
            opacity: 0.5,
            child: Image(
              width: width,
              height: height,
              image: AssetImage(ImgAssets.brokenImg),
            ),
          ),
        );
      },
    );
  }
}
