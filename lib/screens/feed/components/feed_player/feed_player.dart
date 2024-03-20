import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../themes/theme_config.dart';
import '../../../../widgets/img_from_url.dart';
import './multi_manager/flick_multi_manager.dart';
import './multi_manager/flick_multi_player.dart';
import '../../utils/mock_data.dart';

class FeedPlayer extends StatefulWidget {
  final bool isSlider;
  const FeedPlayer({
    super.key,
    this.isSlider = true,
  });

  @override
  State<FeedPlayer> createState() => _FeedPlayerState();
}

class _FeedPlayerState extends State<FeedPlayer> {
  List items = mockData['items'];
  final _now = DateTime.now();
  final _cacheManager = DefaultCacheManager();
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  void dispose() {
    _cacheManager.emptyCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickMultiManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickMultiManager.pause();
        }
      },
      child: widget.isSlider ? _videoSlider() : _videoContent(),
    );
  }

  Widget _videoSlider() {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final playerHeight =
        screenSize.height - screenPadding.top - screenPadding.bottom;
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, index, id) {
        var show = false;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    child: FlickMultiPlayer(
                      url: items[index]['trailer_url'],
                      flickMultiManager: flickMultiManager,
                      cacheManager: _cacheManager,
                      isSlider: widget.isSlider,
                    ),
                  ),
                  Container(
                    height: 60,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              show = !show;
                            });
                          },
                          child: Icon(
                            Icons.arrow_upward_rounded,
                            color: ColorPalettes.nBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (show)
                Container(
                  height: 360,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: Icon(
                          Icons.arrow_downward_rounded,
                          color: ColorPalettes.nBlack,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        });
      },
      options: CarouselOptions(
        height: playerHeight,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget _videoContent() {
    final playerSize = MediaQuery.of(context).size;
    final playerHeight = playerSize.height * 3 / 5;
    return ListView.separated(
      separatorBuilder: (context, i) => Container(
        height: 16,
      ),
      itemCount: items.length,
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
                  url: items[index]['trailer_url'],
                  flickMultiManager: flickMultiManager,
                  cacheManager: _cacheManager,
                  isSlider: widget.isSlider,
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
    final postTime = _now.subtract(
      Duration(
        seconds: randomSeconds,
      ),
    );
    String avatar =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJIwASCJpICHRbFDOQXQ2S-pmikc8vs6K2GA&usqp=CAU';
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
                  url: avatar,
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
                        _iconButton(
                          icon: Icons.public_outlined,
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                          color: TextColors.iconHighEm,
                          size: 16,
                          onTap: () {},
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
            items[index]['title'],
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
