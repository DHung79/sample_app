// import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import '../../../../themes/theme_config.dart';
// import '../../../../widgets/image_widgets/img_from_url.dart';
import '../../components/multi_manager/flick_multi_manager.dart';
import '../../components/multi_manager/flick_multi_player.dart';

class SliderPlayer extends StatefulWidget {
  final List items;
  final FlickMultiManager flickMultiManager;
  final DefaultCacheManager cacheManager;
  const SliderPlayer({
    Key? key,
    required this.items,
    required this.flickMultiManager,
    required this.cacheManager,
  }) : super(key: key);

  @override
  State<SliderPlayer> createState() => _SliderPlayerState();
}

class _SliderPlayerState extends State<SliderPlayer> {
  bool _scrollable = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final playerHeight =
        screenSize.height - screenPadding.top - screenPadding.bottom - 70;
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: playerHeight,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0,
        onPageChanged: (index, reason) {},
        padEnds: false,
        scrollDirection: Axis.vertical,
        scrollPhysics: _scrollable
            ? const NeverScrollableScrollPhysics()
            : const ClampingScrollPhysics(),
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index, id) {
        return SlideVideo(
          onFocus: () {
            setState(
              () {
                _scrollable = !_scrollable;
              },
            );
          },
          flickMultiManager: widget.flickMultiManager,
          cacheManager: widget.cacheManager,
          item: widget.items[index],
        );
      },
    );
  }
}

class SlideVideo extends StatelessWidget {
  final Function() onFocus;
  final dynamic item;
  final FlickMultiManager flickMultiManager;
  final DefaultCacheManager cacheManager;
  const SlideVideo({
    Key? key,
    required this.onFocus,
    required this.item,
    required this.flickMultiManager,
    required this.cacheManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlickMultiPlayer(
            url: item['trailer_url'],
            flickMultiManager: flickMultiManager,
            cacheManager: cacheManager,
            isSlider: true,
            image: item['avatar'],
          ),
        ),
      ],
    );
  }
}
