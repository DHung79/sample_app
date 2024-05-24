import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShopSlider extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int, int)? itemBuilder;
  const ShopSlider({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 100,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0,
        onPageChanged: (index, reason) {},
        padEnds: false,
        scrollDirection: Axis.horizontal,
        scrollPhysics: const ClampingScrollPhysics(),
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
