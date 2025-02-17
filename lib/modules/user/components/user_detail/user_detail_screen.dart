import 'package:flutter/material.dart';

import '../../../../apis/database/user/user.dart';
import '../../../../themes/theme_config.dart';
import '../../../../widgets/image_widgets/img_from_url.dart';
import '../user_card/user_info.dart';
import 'app_bar.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final estimatedColor = Color(stringToHexInt(user.eyeColor.toLowerCase()));
    return Scaffold(
      backgroundColor: estimatedColor,
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: UserDetailAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Wrap(
                    children: [
                      _userImg(),
                      _userDetail(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userImg() {
    return Hero(
      tag: '${user.id}image',
      child: ImgFromUrl(
        height: 200,
        url: user.image,
      ),
    );
  }

  Widget _userDetail() {
    final userFullName = '${user.lastName} ${user.firstName}';
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfo.userInfo(
            title: 'Name',
            contentText: userFullName,
          ),
          UserInfo.userInfo(
            title: 'Age',
            contentText: user.age.toString(),
          ),
          UserInfo.userInfo(
            title: 'Gender',
            customContent: UserInfo.userGender(user.gender),
          ),
          UserInfo.userInfo(
            title: 'Day of birth',
            contentText: user.birthDate,
          ),
          UserInfo.userInfo(
            title: 'Email',
            contentText: user.email,
          ),
          UserInfo.userInfo(
            title: 'Phone',
            contentText: user.phone,
          ),
          UserInfo.userInfo(
            title: 'Height',
            contentText: '${user.height / 100} m',
          ),
          UserInfo.userInfo(
            title: 'Weight',
            contentText: '${user.weight} kg',
          ),
        ],
      ),
    );
  }
}
