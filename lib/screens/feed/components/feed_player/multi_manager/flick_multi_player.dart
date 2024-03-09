import 'package:flick_video_player/flick_video_player.dart';
import '../../../../../themes/theme_config.dart';
import '../portrait_controls.dart';
import '../custom_package/flick_video_player.dart' as custom;
import './flick_multi_manager.dart';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

class FlickMultiPlayer extends StatefulWidget {
  const FlickMultiPlayer({
    super.key,
    required this.url,
    this.image,
    required this.flickMultiManager,
  });

  final String url;
  final String? image;
  final FlickMultiManager flickMultiManager;

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
    super.initState();
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
            controls: FeedPlayerPortraitControls(
              flickMultiManager: widget.flickMultiManager,
              flickManager: flickManager,
            ),
          ),
          flickVideoWithControlsFullscreen: FlickVideoWithControls(
            videoFit: BoxFit.contain,
            controls: FeedPlayerPortraitControls(
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
