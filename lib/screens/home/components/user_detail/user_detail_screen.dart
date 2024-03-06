import 'package:flutter/material.dart';
import '../../../../apis/user/user.dart';
import '../../../../themes/theme_config.dart';
import 'app_bar.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: UserDetailAppBar(),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
      ),
    );
  }

  Widget _userImg() {
    return Hero(
      tag: user.id,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadowStyle.e01,
          ],
          color: Colors.lightBlueAccent.shade200,
        ),
        child: Image.network(user.image),
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
          _userInfo(
            title: 'Name',
            contentText: userFullName,
          ),
          _userInfo(
            title: 'Age',
            contentText: user.age.toString(),
          ),
          _userInfo(
            title: 'Gender',
            customContent: _userGender(user.gender),
          ),
          _userInfo(
            title: 'Day of birth',
            contentText: user.birthDate,
          ),
          _userInfo(
            title: 'Email',
            contentText: user.email,
          ),
          _userInfo(
            title: 'Phone',
            contentText: user.phone,
          ),
          _userInfo(
            title: 'Height',
            contentText: '${user.height / 100} m',
          ),
          _userInfo(
            title: 'Weight',
            contentText: '${user.weight} kg',
          ),
        ],
      ),
    );
  }

  Widget _userInfo({
    required String title,
    String? contentText,
    Widget? customContent,
  }) {
    return Wrap(
      children: [
        Text(
          title,
          style: CustomTextStyle.mediumH5(
            color: TextColors.textHighEm,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 16, 0),
          child: Text(
            ':',
            style: CustomTextStyle.mediumH5(
              color: TextColors.textHighEm,
            ),
          ),
        ),
        if (contentText != null)
          Text(
            contentText,
            style: CustomTextStyle.boldH5(
              color: TextColors.textHighEm,
            ),
          ),
        if (customContent != null) customContent,
      ],
    );
  }

  Widget _userGender(String gender) {
    IconData? icon;
    Color? iconColor;
    if (gender.toLowerCase() == 'male') {
      icon = Icons.male_rounded;
      iconColor = Colors.blue.shade200;
    } else {
      icon = Icons.female_rounded;
      iconColor = Colors.pink.shade200;
    }
    return Icon(
      icon,
      size: 40,
      color: iconColor,
    );
  }
}
