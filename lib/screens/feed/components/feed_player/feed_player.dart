import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/themes/theme_config.dart';
import 'package:visibility_detector/visibility_detector.dart';
import './multi_manager/flick_multi_manager.dart';
import './multi_manager/flick_multi_player.dart';
import '../utils/mock_data.dart';

class FeedPlayer extends StatefulWidget {
  final bool isSlider;
  const FeedPlayer({
    super.key,
    this.isSlider = true,
  });

  @override
  State<FeedPlayer> createState() => _FeedPlayerState();
}

class _FeedPlayerState extends State<FeedPlayer> {
  List items = mockData['items'];

  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickMultiManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickMultiManager.pause();
        }
      },
      child: widget.isSlider ? _videoSlider() : _videoContent(),
    );
  }

  Widget _videoSlider() {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final playerHeight =
        screenSize.height - screenPadding.top - screenPadding.bottom;
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, index, id) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: FlickMultiPlayer(
            url: items[index]['trailer_url'],
            flickMultiManager: flickMultiManager,
          ),
        );
      },
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
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget _videoContent() {
    final playerSize = MediaQuery.of(context).size;
    final playerHeight = playerSize.height * 3 / 5;
    return ListView.separated(
      separatorBuilder: (context, i) => Container(
        height: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.amber,
          height: playerHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Text(
                    items[index]['title'],
                    style: CustomTextStyle.boldBody(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FlickMultiPlayer(
                    url: items[index]['trailer_url'],
                    flickMultiManager: flickMultiManager,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
