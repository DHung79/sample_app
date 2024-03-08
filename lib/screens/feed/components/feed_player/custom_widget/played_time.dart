import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Returns a text widget with left duration of the video.
class PlayedTime extends StatelessWidget {
  const PlayedTime({
    super.key,
    this.fontSize,
    this.color,
  });

  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    FlickVideoManager videoManager = Provider.of<FlickVideoManager>(context);

    Duration? playedTime = videoManager.videoPlayerValue?.position;

    String? playedTimeInMinutes = playedTime != null
        ? (playedTime - Duration(hours: playedTime.inHours))
            .inMinutes
            .toString()
            .padLeft(2, '0')
        : null;

    String? playedTimeInSeconds = playedTime != null
        ? (playedTime - Duration(minutes: playedTime.inMinutes))
            .inSeconds
            .toString()
            .padLeft(2, '0')
        : null;

    String textDuration = playedTime != null
        ? playedTime.inHours > 0
            ? '${playedTime.inHours}:$playedTimeInMinutes:$playedTimeInSeconds'
            : '${playedTime.inMinutes}:$playedTimeInSeconds'
        : '0:00';

    return Text(
      textDuration,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
