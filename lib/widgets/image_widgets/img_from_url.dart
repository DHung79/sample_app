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
  final bool useOldImageOnUrlChange;
  const ImgFromUrl({
    Key? key,
    required this.url,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.width,
    this.height,
    this.duration,
    this.useOldImageOnUrlChange = true,
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
      useOldImageOnUrlChange: useOldImageOnUrlChange,
      //imageBuilder: to not show placeholder when image is loaded
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return placeholder ??
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}
