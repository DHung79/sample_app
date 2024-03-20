import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../themes/theme_config.dart';

class ImgFromUrl extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final ImageProvider<Object>? placeholder;
  final double? width;
  final double? height;
  final int? duration;
  const ImgFromUrl({
    super.key,
    required this.url,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.width,
    this.height,
    this.duration,
  });
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
        return const IndicatorStyle();
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Image(
            image: placeholder ?? AssetImage(ImgAssets.placeholder),
          ),
        );
      },
    );
  }
}
