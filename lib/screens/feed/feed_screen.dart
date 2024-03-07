import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/feed_player/feed_player.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: FeedAppBar(),
      ),
      body: SafeArea(
        child: FeedPlayer(),
      ),
    );
  }
}
