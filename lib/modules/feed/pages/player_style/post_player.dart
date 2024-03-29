import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../../themes/theme_config.dart';
import '../../../../widgets/image_widgets/img_from_url.dart';
import '../../components/multi_manager/flick_multi_manager.dart';
import '../../components/multi_manager/flick_multi_player.dart';

class PostPlayer extends StatefulWidget {
  final List items;
  final FlickMultiManager flickMultiManager;
  final DefaultCacheManager cacheManager;
  const PostPlayer({
    super.key,
    required this.items,
    required this.flickMultiManager,
    required this.cacheManager,
  });

  @override
  State<PostPlayer> createState() => _PostPlayerState();
}

class _PostPlayerState extends State<PostPlayer> {
  @override
  Widget build(BuildContext context) {
    final playerSize = MediaQuery.of(context).size;
    final playerHeight = playerSize.height * 3 / 5;
    return ListView.separated(
      separatorBuilder: (context, i) => Container(
        height: 16,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          constraints: BoxConstraints(
            minHeight: playerHeight,
            maxHeight: playerSize.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: _contentHeader(
                    index: index,
                  ),
                ),
              ),
              SizedBox(
                height: playerHeight - 150,
                child: FlickMultiPlayer(
                  url: widget.items[index]['trailer_url'],
                  flickMultiManager: widget.flickMultiManager,
                  cacheManager: widget.cacheManager,
                  isSlider: false,
                ),
              ),
              Container(
                height: 50,
                decoration: const BoxDecoration(),
                child: Row(
                  children: [
                    Transform.flip(
                      flipX: true,
                      child: _iconButton(
                        icon: Icons.thumb_up_alt_outlined,
                        onTap: () {},
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _iconButton(
                          icon: Icons.comment_outlined,
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: _iconButton(
                            icon: Icons.share_outlined,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _contentHeader({
    required int index,
  }) {
    final randomSeconds = Random().nextInt(24 * 60 * 60);
    final now = DateTime.now();
    final postTime = now.subtract(
      Duration(
        seconds: randomSeconds,
      ),
    );

    double imgSize = 50;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: ImgFromUrl(
                  url: widget.items[index]['avatar'],
                  width: imgSize,
                  height: imgSize,
                  placeholder: Container(
                    color: ColorPalettes.g100,
                    width: imgSize,
                    height: imgSize,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: TextColors.iconHighEm,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: Text(
                        'User Avatar',
                        style: CustomTextStyle.boldBody(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          timeAgoFromNow(
                            postTime,
                            context,
                          ),
                          style: CustomTextStyle.mediumBody(
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: Icon(
                            Icons.public_outlined,
                            color: TextColors.iconHighEm,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Text(
            widget.items[index]['title'],
            style: CustomTextStyle.boldBody(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconButton({
    Function()? onTap,
    IconData? icon,
    Color? color,
    double size = 24,
    Decoration? decoration,
    EdgeInsetsGeometry? padding,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: padding ?? const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Icon(
            icon ?? Icons.navigate_next_sharp,
            color: color ?? TextColors.iconHighEm,
            size: size,
          ),
        ),
      ),
    );
  }
}
