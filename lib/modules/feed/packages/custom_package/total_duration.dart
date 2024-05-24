import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Returns a text widget with total duration of the video.
class TotalDuration extends StatelessWidget {
  const TotalDuration({
    Key? key,
    this.fontSize,
    this.color,
  }) : super(key: key);

  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    FlickVideoManager videoManager = Provider.of<FlickVideoManager>(context);

    Duration? duration = videoManager.videoPlayerValue?.duration;

    String? durationInSeconds = duration != null
        ? (duration - Duration(minutes: duration.inMinutes))
            .inSeconds
            .toString()
            .padLeft(2, '0')
        : null;

    String? durationInMinutes = duration != null
        ? (duration - Duration(hours: duration.inHours))
            .inMinutes
            .toString()
            .padLeft(2, '0')
        : null;

    String? durationInHours = duration != null
        ? (duration - Duration(days: duration.inDays))
            .inHours
            .toString()
            .padLeft(2, '0')
        : null;

    String textDuration = '0:00';
    if (duration != null) {
      if (duration.inDays > 0) {
        textDuration =
            '${duration.inDays}:$durationInHours:$durationInMinutes:$durationInSeconds';
      } else if (duration.inHours > 0) {
        textDuration =
            '${duration.inHours}:$durationInMinutes:$durationInSeconds';
      } else {
        textDuration = '${duration.inMinutes}:$durationInSeconds';
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
