import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../../../themes/theme_config.dart';
import '../player_display_controls/landscape_controls.dart';
import '../player_display_controls/portrait_controls.dart';
import '../custom_package/flick_video_player.dart' as custom;
import './flick_multi_manager.dart';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

class FlickMultiPlayer extends StatefulWidget {
  final String url;
  final String? image;
  final FlickMultiManager flickMultiManager;
  final DefaultCacheManager cacheManager;
  final bool isSlider;
  const FlickMultiPlayer({
    super.key,
    required this.url,
    this.image,
    required this.flickMultiManager,
    required this.cacheManager,
    required this.isSlider,
  });

  @override
  State<FlickMultiPlayer> createState() => _FlickMultiPlayerState();
}

class _FlickMultiPlayerState extends State<FlickMultiPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(widget.url))
            ..setLooping(true),
      autoPlay: false,
    );
    widget.flickMultiManager.init(flickManager);
    _getFile();
    super.initState();
  }

  _getFile() async {
    var fileFromCache = await widget.cacheManager.getFileFromCache(widget.url);
    if (fileFromCache != null) {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(fileFromCache.file)
          ..setLooping(true),
        autoPlay: false,
      );
    } else {
      File file =
          await widget.cacheManager.getSingleFile(widget.url, key: widget.url);
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(file)
          ..setLooping(true),
        autoPlay: false,
      );
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visiblityInfo) {
        if (visiblityInfo.visibleFraction > 0.9) {
          widget.flickMultiManager.play(flickManager);
        }
      },
      child: PopScope(
        canPop: !flickManager.flickControlManager!.isFullscreen,
        onPopInvoked: (didPop) {
          if (flickManager.flickControlManager!.isFullscreen) {
            flickManager.flickControlManager!.exitFullscreen();
            setState(() {});
          }
        },
        child: custom.FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            videoFit: BoxFit.contain,
            playerLoadingFallback: Center(
              child: CircularProgressIndicator(
                color: ColorPalettes.g100,
                backgroundColor: Colors.transparent,
                strokeWidth: 4,
              ),
            ),
            controls: widget.isSlider
                ? FeedPlayerPortraitControls(
                    flickMultiManager: widget.flickMultiManager,
                    flickManager: flickManager,
                    avatar: widget.image ?? '',
                  )
                : FeedPlayerLandscapeControls(
                    flickMultiManager: widget.flickMultiManager,
                    flickManager: flickManager,
                  ),
          ),
          flickVideoWithControlsFullscreen: FlickVideoWithControls(
            videoFit: BoxFit.contain,
            controls: FeedPlayerLandscapeControls(
              flickMultiManager: widget.flickMultiManager,
              flickManager: flickManager,
            ),
            iconThemeData: const IconThemeData(
              size: 40,
              color: Colors.white,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
