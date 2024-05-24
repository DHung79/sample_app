import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Returns a text widget with left duration of the video.
class PlayedTime extends StatelessWidget {
  const PlayedTime({
    Key? key,
    this.fontSize,
    this.color,
  }) : super(key: key);

  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    FlickVideoManager videoManager = Provider.of<FlickVideoManager>(context);

    Duration? playedTime = videoManager.videoPlayerValue?.position;

    String? playedTimeInSeconds = playedTime != null
        ? (playedTime - Duration(minutes: playedTime.inMinutes))
            .inSeconds
            .toString()
            .padLeft(2, '0')
        : null;

    String? playedTimeInMinutes = playedTime != null
        ? (playedTime - Duration(hours: playedTime.inHours))
            .inMinutes
            .toString()
            .padLeft(2, '0')
        : null;

    String? playedTimeInHours = playedTime != null
        ? (playedTime - Duration(days: playedTime.inDays))
            .inHours
            .toString()
            .padLeft(2, '0')
        : null;

    String textDuration = '0:00';
    if (playedTime != null) {
      if (playedTime.inDays > 0) {
        textDuration =
            '${playedTime.inDays}:$playedTimeInHours:$playedTimeInMinutes:$playedTimeInSeconds';
      } else if (playedTime.inHours > 0) {
        textDuration =
            '${playedTime.inHours}:$playedTimeInMinutes:$playedTimeInSeconds';
      } else {
        textDuration = '${playedTime.inMinutes}:$playedTimeInSeconds';
      }
    }

    return Text(
      textDuration,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
