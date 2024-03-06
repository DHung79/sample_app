import 'dart:ui';
import '../logger/logger.dart';

class ImgBaseSize {
  static Size avatar = const Size(1080, 720);
  static Size avatarCover = const Size(1920, 1080);
  static Size logo = const Size(1080, 720);
  static List<String> allowedExtensions = [
    'jpg',
    'jpeg',
    'png',
    'jif',
    'jfjf',
    'jpe',
  ];
  static Size getResize({
    required Size baseSize,
    required Image image,
  }) {
    double resizedWidth = 0;
    double resizedHeight = 0;
    final imgBaseWidth = baseSize.width;
    final imgBaseHeight = baseSize.height;
    final aspectRatio = image.width / image.height;
    if (imgBaseWidth > imgBaseHeight) {
      if (image.width == image.height) {
        resizedWidth = imgBaseHeight;
        resizedHeight = imgBaseHeight;
      } else {
        resizedWidth = (imgBaseHeight * aspectRatio);
        resizedHeight = imgBaseHeight;
      }
    } else {
      if (image.width == image.height) {
        resizedWidth = imgBaseWidth;
        resizedHeight = imgBaseWidth;
      } else {
        resizedWidth = imgBaseWidth;
        resizedHeight = imgBaseWidth / aspectRatio;
      }
    }
    logDebug('resizedWidth: $resizedWidth\nresizedHeight: $resizedHeight ');
    return Size(resizedWidth, resizedHeight);
  }
}
