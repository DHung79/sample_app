import 'package:flutter/material.dart';
import '../../widgets/layout_widgets/bottom_nav_bar.dart';
import '../../widgets/layout_widgets/layout_scaffold.dart';
import '../feed/pages/feed_player/app_bar.dart';
import '../feed/pages/feed_player/feed_player.dart';
import '../friends/friends_screen.dart';
import '../shop/shop_screen.dart';
import '../user/user_screen.dart';

class VKAppScreen extends StatefulWidget {
  const VKAppScreen({Key? key}) : super(key: key);

  @override
  State<VKAppScreen> createState() => _VKAppScreenState();
}

class _VKAppScreenState extends State<VKAppScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return LayoutScaffold(
      body: _buildBody(),
      bottomNavigationBar: SizedBox(
        height: 71 + bottomPadding,
        child: BottomNavBar(
          tabs: [
            BottomNavBarItem(
              theme: BottomBarTheme.dark(),
              title: 'Home',
              icon: Icons.home,
              outlineIcon: Icons.home_outlined,
              onTap: () {
                setState(() {
                  _currentTab = 0;
                });
              },
            ),
            BottomNavBarItem(
              theme: BottomBarTheme.light(),
              title: 'Shop',
              icon: Icons.shopping_bag,
              outlineIcon: Icons.shopping_bag_outlined,
              onTap: () {
                setState(() {
                  _currentTab = 1;
                });
              },
            ),
            BottomNavBarItem(
              theme: BottomBarTheme.dark(),
              title: 'Friends',
              icon: Icons.people,
              outlineIcon: Icons.people_outline,
              onTap: () {
                setState(() {
                  _currentTab = 2;
                });
              },
            ),
            BottomNavBarItem(
              theme: BottomBarTheme.light(),
              title: 'User',
              icon: Icons.person,
              outlineIcon: Icons.person_outline,
              onTap: () {
                setState(() {
                  _currentTab = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentTab) {
      case 0:
        return _feedScreen();
      case 1:
        return const ShopScreen();
      case 2:
        return const FriendsScreen();
      case 3:
        return const UserScreen();
      default:
        return _feedScreen();
    }
  }

  Widget _feedScreen() {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final playerHeight =
        screenSize.height - screenPadding.top - screenPadding.bottom - 70;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: playerHeight,
              child: const FeedPlayer(),
            ),
            const FeedPlayerAppBar(
              title: 'Slider Video',
            ),
          ],
        ),
      ),
    );
  }
}
