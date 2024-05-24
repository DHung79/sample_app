import 'package:flutter/material.dart';
import '../../modules/shop/components/shop_slider.dart';
import '../../themes/theme_config.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalettes.nWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: _searchField(),
                ),
                // GestureDetector(
                //   child: const Padding(
                //     padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                //     child: Icon(
                //       Icons.shopping_cart_outlined,
                //       size: 24,
                //     ),
                //   ),
                //   onTap: () {
                //     logDebug('click camera icon');
                //   },
                // ),
                // GestureDetector(
                //   child: const Padding(
                //     padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                //     child: Icon(
                //       Icons.menu,
                //       size: 24,
                //     ),
                //   ),
                //   onTap: () {
                //     logDebug('click camera icon');
                //   },
                // ),
              ],
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  _sliderField(),
                  Row(
                    children: [
                      // _brand(),
                      // _brand(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchField() {
    const double inputHeight = 50;
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: inputHeight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          key: _formKey,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadowStyle.e06],
          ),
          child: FormFieldText(
            maxLength: 50,
            counterText: '',
            controller: _commentController,
            keyboardType: TextInputType.text,
            contentPadding: const EdgeInsets.fromLTRB(16, 10, 20, 10),
            suffixIcon: GestureDetector(
              child: const Icon(
                Icons.search,
                size: 24,
              ),
              onTap: () {
                logDebug('click search icon');
              },
            ),
            hintText: 'search...',
            onSaved: (value) {
              _commentController.text = value!.trim();
            },
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }

  Widget _sliderField() {
    return Column(
      children: [
        ShopSlider(
          itemCount: 5,
          itemBuilder: (context, index, id) {
            return Container(
              color: Colors.orangeAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$index'),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: ShopSlider(
            itemCount: 7,
            itemBuilder: (context, index, id) {
              return Container(
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$index'),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
