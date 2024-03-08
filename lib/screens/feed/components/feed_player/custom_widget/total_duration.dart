import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Returns a text widget with total duration of the video.
class TotalDuration extends StatelessWidget {
  const TotalDuration({
    super.key,
    this.fontSize,
    this.color,
  });

  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    FlickVideoManager videoManager = Provider.of<FlickVideoManager>(context);

    Duration? duration = videoManager.videoPlayerValue?.duration;

    String? durationInMinutes = duration != null
        ? (duration - Duration(hours: duration.inHours))
            .inMinutes
            .toString()
            .padLeft(2, '0')
        : null;

    String? durationInSeconds = duration != null
        ? (duration - Duration(minutes: duration.inMinutes))
            .inSeconds
            .toString()
            .padLeft(2, '0')
        : null;

    String textDuration = duration != null
        ? duration.inHours > 0
            ? '${duration.inHours}:$durationInMinutes:$durationInSeconds'
            : '${duration.inMinutes}:$durationInSeconds'
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
