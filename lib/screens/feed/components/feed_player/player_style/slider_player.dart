import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../../../themes/theme_config.dart';
import '../../../../../widgets/img_from_url.dart';
import '../multi_manager/flick_multi_manager.dart';
import '../multi_manager/flick_multi_player.dart';

class SliderPlayer extends StatefulWidget {
  final List items;
  final FlickMultiManager flickMultiManager;
  final DefaultCacheManager cacheManager;
  const SliderPlayer({
    super.key,
    required this.items,
    required this.flickMultiManager,
    required this.cacheManager,
  });

  @override
  State<SliderPlayer> createState() => _SliderPlayerState();
}

class _SliderPlayerState extends State<SliderPlayer> {
  bool _scrollable = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final playerHeight =
        screenSize.height - screenPadding.top - screenPadding.bottom;
    return CarouselSlider.builder(
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
        scrollPhysics: _scrollable
            ? const NeverScrollableScrollPhysics()
            : const ClampingScrollPhysics(),
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index, id) {
        return SlideVideo(
          onFocus: () {
            setState(
              () {
                _scrollable = !_scrollable;
              },
            );
          },
          flickMultiManager: widget.flickMultiManager,
          cacheManager: widget.cacheManager,
          item: widget.items[index],
        );
      },
    );
  }
}

class SlideVideo extends StatefulWidget {
  final Function() onFocus;
  final dynamic item;
  final FlickMultiManager flickMultiManager;
  final DefaultCacheManager cacheManager;
  const SlideVideo({
    super.key,
    required this.onFocus,
    required this.item,
    required this.flickMultiManager,
    required this.cacheManager,
  });

  @override
  State<SlideVideo> createState() => _SlideVideoState();
}

class _SlideVideoState extends State<SlideVideo> {
  final _commentController = TextEditingController();
  final _focus = FocusNode();
  bool _showComments = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _focus.addListener(_onFocus);
    super.initState();
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocus);
    _focus.dispose();
    super.dispose();
  }

  _onFocus() {
    // setState(() {
    _showComments = !_showComments;
    // widget.onFocus();
    // });
    // SystemChannels.textInput.invokeMethod("TextInput.show");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: FlickMultiPlayer(
                url: widget.item['trailer_url'],
                flickMultiManager: widget.flickMultiManager,
                cacheManager: widget.cacheManager,
                isSlider: true,
                image: widget.item['avatar'],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
        _commentField(),
      ],
    );
  }

  Widget _commentField() {
    final screenSize = MediaQuery.of(context).size;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double inputHeight = 60;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (_showComments)
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _focus.unfocus();
                });
              },
            ),
          ),
        SizedBox(
          height: 230,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              if (_showComments)
                Container(
                  color: Colors.white,
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, inputHeight),
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return _comment();
                    },
                  ),
                ),
              Container(
                key: _formKey,
                height: inputHeight,
                width: screenSize.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: TextFieldStyle(
                    focusNode: _focus,
                    contentPadding: const EdgeInsets.fromLTRB(16, 10, 20, 10),
                    hasValidate: false,
                    hintText: 'Type your comment',
                    keyboardType: TextInputType.text,
                    controller: _commentController,
                    maxLength: 50,
                    onSaved: (value) {
                      _commentController.text = value!.trim();
                    },
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_showComments)
          SizedBox(
            height: keyboardHeight,
          ),
      ],
    );
  }

  Widget _comment() {
    final now = DateTime.now();
    final randomSeconds = Random().nextInt(24 * 60 * 60);
    final postTime = now.subtract(
      Duration(
        seconds: randomSeconds,
      ),
    );

    double imgSize = 40;
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
                  url: widget.item['avatar'],
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorPalettes.pBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                child: Text(
                                  'User Avatar',
                                  style: CustomTextStyle.boldBody(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                widget.item['title'],
                                style: CustomTextStyle.mediumBody(
                                  color: Colors.white,
                                ),
                              ),
                            ],
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
                              color: TextColors.iconHighEm,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
