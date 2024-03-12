import 'package:flutter/material.dart';
import '../../../apis/drop_ship/resources/drop_ship_api_provider.dart';
import '../../../themes/theme_config.dart';

final List<ButtonContent> _buttons = [
  ButtonContent(
      name: 'get Token',
      onPressed: () {
        DropShipApiProvider().getToken();
      }),
  ButtonContent(
    name: 'owner Register',
    onPressed: () {
      DropShipApiProvider().ownerRegister(
        body: {
          "EMAIL": "astronaut02@gmail.com",
          "PHONE": "0345599061",
          "NAME": "astronaut 002",
          "ADDRESS": "to the moon",
          "WARDS_ID": 494,
          "PASSWORD": 'astronaut',
        },
      );
    },
  ),
  ButtonContent(
    name: 'owner connect',
    onPressed: () {
      DropShipApiProvider().ownerconnect(
        body: {
          "USERNAME": 'astronaut02@gmail.com',
          "PASSWORD": 'astronaut',
        },
      );
    },
  ),
];

class ViettelPost extends StatelessWidget {
  const ViettelPost({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: _buttons.length,
      itemBuilder: (BuildContext context, int index) {
        final button = _buttons[index];
        return CustomButtonStyle.roundDark(
          color: Colors.amberAccent,
          onPressed: button.onPressed,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              button.name,
              style: CustomTextStyle.boldStandard(
                color: TextColors.textWhite,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ButtonContent {
  final String name;
  final Function()? onPressed;
  ButtonContent({
    required this.name,
    this.onPressed,
  });
}
