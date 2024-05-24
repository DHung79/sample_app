import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../themes/theme_config.dart';
import '../../../../widgets/image_widgets/img_from_url.dart';
import '../multi_manager/flick_multi_manager.dart';

class FeedPlayerPortraitControls extends StatelessWidget {
  const FeedPlayerPortraitControls({
    Key? key,
    this.flickMultiManager,
    this.flickManager,
    this.iconSize = 32,
    this.fontSize = 12,
    this.progressBarSettings,
    required this.avatar,
  }) : super(key: key);

  final FlickMultiManager? flickMultiManager;
  final FlickManager? flickManager;
  final double iconSize;
  final double fontSize;
  final FlickProgressBarSettings? progressBarSettings;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.black12,
          ),
          _togglePlayAction(
            context: context,
          ),
          _videoActionBar(),
          FlickAutoHideChild(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlickVideoProgressBar(
                  flickProgressBarSettings: progressBarSettings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _togglePlayAction({
    required BuildContext context,
  }) {
    FlickControlManager controlManager =
        Provider.of<FlickControlManager>(context);

    VideoPlayerController? videoPlayerController =
        Provider.of<FlickVideoManager>(context).videoPlayerController;

    return FlickTogglePlayAction(
      togglePlay: () {
        controlManager.togglePlay();
      },
      child: FlickSeekVideoAction(
        child: Center(
          child: _getChildWidget(videoPlayerController),
        ),
      ),
    );
  }

  Widget _getChildWidget(
    VideoPlayerController? videoPlayerController,
  ) {
    var videoStatus = flickManager!.flickVideoManager!;
    if (videoPlayerController?.value.isBuffering == true) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorPalettes.g100,
          backgroundColor: Colors.transparent,
          strokeWidth: 4,
        ),
      );
    } else {
      return AnimatedOpacity(
        opacity: !videoStatus.isPlaying ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black38,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              !videoStatus.isPlaying ? Icons.play_arrow : Icons.pause,
              size: 50,
            ),
          ),
        ),
      );
    }
  }

  Widget _videoActionBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              iconButon(
                icon: Icons.favorite_rounded,
                onTap: () {},
              ),
              SizedBox(
                height: iconSize,
              ),
              Transform.flip(
                flipX: true,
                child: iconButon(
                  icon: Icons.sms_rounded,
                  onTap: () {
                    SystemChannels.textInput.invokeMethod("TextInput.show");
                  },
                ),
              ),
              SizedBox(
                height: iconSize,
              ),
              iconButon(
                icon: Icons.turned_in_rounded,
                onTap: () {},
              ),
              SizedBox(
                height: iconSize,
              ),
              iconButon(
                icon: Icons.tiktok_rounded,
                onTap: () {},
              ),
              SizedBox(
                height: iconSize,
              ),
              ClipOval(
                child: ImgFromUrl(
                  url: avatar,
                  width: iconSize,
                  height: iconSize,
                  placeholder: Container(
                    color: ColorPalettes.g100,
                    width: iconSize,
                    height: iconSize,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: iconSize - 10,
                        color: TextColors.iconHighEm,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget iconButon({
    Function()? onTap,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: ColorPalettes.white100,
        shadows: [
          BoxShadowStyle.e01,
        ],
        size: iconSize,
      ),
    );
  }
}
