import 'package:flutter/material.dart';
import 'svg_icons.dart';

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
    final uri = Uri.tryParse(url)!;
    //loop return wiget to fix bug: some time Image network request is closed for some reason;
    return FadeInImage(
      width: width,
      height: height,
      fadeInDuration: transitionDuration,
      fadeOutDuration: transitionDuration,
      placeholder: placeholder ?? AssetImage(ImgAssets.comingSoon),
      image: NetworkImage(
        uri.toString(),
      ),
      fit: fit,
      imageErrorBuilder: (context, error, stacktrace) {
        return FadeInImage(
          width: width,
          height: height,
          fadeInDuration: transitionDuration,
          fadeOutDuration: transitionDuration,
          placeholder: placeholder ?? AssetImage(ImgAssets.comingSoon),
          image: NetworkImage(
            uri.toString(),
          ),
          fit: fit,
          imageErrorBuilder: (context, error, stacktrace) {
            return FadeInImage(
              width: width,
              height: height,
              fadeInDuration: transitionDuration,
              fadeOutDuration: transitionDuration,
              placeholder: placeholder ?? AssetImage(ImgAssets.comingSoon),
              image: NetworkImage(
                uri.toString(),
              ),
              fit: fit,
              imageErrorBuilder: (context, error, stacktrace) {
                return Image(
                  image: placeholder ?? AssetImage(ImgAssets.comingSoon),
                );
              },
            );
          },
        );
      },
    );
  }
}
