import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Returns a text widget with left duration of the video.
class LeftDuration extends StatelessWidget {
  const LeftDuration({
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
    Duration? position = videoManager.videoPlayerValue?.position;

    Duration? durationLeft =
        position != null && duration != null ? duration - position : null;
        
    String? durationLeftInMinutes = durationLeft != null
        ? (durationLeft - Duration(hours: durationLeft.inHours))
            .inMinutes
            .toString()
            .padLeft(2, '0')
        : null;

    String? durationLeftInSeconds = durationLeft != null
        ? (durationLeft - Duration(minutes: durationLeft.inMinutes))
            .inSeconds
            .toString()
            .padLeft(2, '0')
        : null;

    String textDuration = durationLeft != null
        ? duration!.inHours > 0
            ? '${durationLeft.inHours}:$durationLeftInMinutes:$durationLeftInSeconds'
            : '${durationLeft.inMinutes}:$durationLeftInSeconds'
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
