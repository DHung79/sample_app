import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/screens/feed/components/feed_player/custom_widget/left_duration.dart';
import './multi_manager/flick_multi_manager.dart';
import 'custom_widget/total_duration.dart';

class FeedPlayerPortraitControls extends StatelessWidget {
  const FeedPlayerPortraitControls({
    super.key,
    this.flickMultiManager,
    this.flickManager,
    this.iconSize = 20,
    this.fontSize = 12,
    this.progressBarSettings,
  });

  final FlickMultiManager? flickMultiManager;
  final FlickManager? flickManager;
  final double iconSize;
  final double fontSize;
  final FlickProgressBarSettings? progressBarSettings;

  @override
  Widget build(BuildContext context) {
    FlickControlManager controlManager =
        Provider.of<FlickControlManager>(context);
    var videoStatus = flickManager!.flickVideoManager!;
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        children: <Widget>[
          FlickTogglePlayAction(
            togglePlay: () {
              controlManager.togglePlay();
            },
            child: FlickSeekVideoAction(
              child: Center(
                child: AnimatedOpacity(
                  opacity:
                      videoStatus.isBuffering || videoStatus.isPlaying ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        videoStatus.isPlaying ? Icons.play_arrow : Icons.pause,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlickVideoProgressBar(
                    flickProgressBarSettings: progressBarSettings,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlickPlayToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      FlickSoundToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      Row(
                        children: <Widget>[
                          LeftDuration(
                            fontSize: fontSize,
                          ),
                          FlickAutoHideChild(
                            child: Text(
                              ' / ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: fontSize),
                            ),
                          ),
                          TotalDuration(
                            fontSize: fontSize,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlickSubtitleToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      FlickFullScreenToggle(
                        size: iconSize,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
