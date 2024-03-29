import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'multi_manager/flick_multi_manager.dart';
import '../../utils/mock_data.dart';
import 'player_style/post_player.dart';
import 'player_style/slider_player.dart';

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
  List items = mockData['items']..shuffle();
  final _cacheManager = DefaultCacheManager();
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  void dispose() {
    _cacheManager.emptyCache();
    super.dispose();
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
      child: widget.isSlider
          ? SliderPlayer(
              items: items,
              flickMultiManager: flickMultiManager,
              cacheManager: _cacheManager,
            )
          : PostPlayer(
              items: items,
              flickMultiManager: flickMultiManager,
              cacheManager: _cacheManager,
            ),
    );
  }
}
