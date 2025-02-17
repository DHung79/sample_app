import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../apis/configs/rest/rest_api_handler_data.dart';
import '../../../themes/theme_config.dart';
import '../packages/flutter_scalable_ocr.dart';

class TranslateOCRScreen extends StatefulWidget {
  const TranslateOCRScreen({Key? key}) : super(key: key);

  @override
  State<TranslateOCRScreen> createState() => _TranslateOCRScreenState();
}

class _TranslateOCRScreenState extends State<TranslateOCRScreen> {
  final StreamController<TranslateController> controller =
      StreamController<TranslateController>();
  String rawText = '';
  String translateText = '';
  String listenText = '';

  Future<void> setText(value) async {
    final translateText = await translate(value);
    if (!controller.isClosed) {
      controller.add(
        TranslateController(rawText: value, translateText: translateText),
      );
      setState(() {
        listenText = value;
      });
    }
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          children: [
            ScalableOCR(
                boxHeight: MediaQuery.of(context).size.height / 2,
                getRawData: (value) {
                  inspect(value);
                },
                getScannedText: (value) {
                  setText(value);
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: StreamBuilder(
                stream: controller.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<TranslateController> snapshot) {
                  if (snapshot.hasData) {
                    final streamText = snapshot.data!.rawText;
                    return Text(
                      "Readed text: $streamText",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Raw text',
                          style: CustomTextStyle.boldStandard(),
                        ),
                        Text(rawText),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: TextColors.iconHighEm,
                    thickness: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Translate text',
                          style: CustomTextStyle.boldStandard(),
                        ),
                        Text(translateText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                rawText = listenText;
                translateText = await translate(rawText);
                setState(() {});
              },
              child: Text(
                'Translate',
                style: CustomTextStyle.boldStandard(
                  color: TextColors.textWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> translate(String text) async {
  final query = {
    'client': 'gtx',
    'sl': 'en',
    'tl': 'vi',
    'dt': 't',
    'q': text.trim(),
  };

  String result = '';

  try {
    var path = 'https://translate.googleapis.com/translate_a/single';
    var queries = <String>[];
    query.forEach((key, value) => queries.add('$key=$value'));
    path += '?${queries.join('&')}';
    final response = await RestApiHandlerData.getDynamic(
      path: path,
    );
    // logDebug('path: $path');
    // logDebug('response: $response');
    final data = response[0];

    data.forEach((element) {
      result += element[0];
    });
  } catch (e) {
    result = text;
  }
  return result;
}

class TranslateController {
  final String rawText;
  final String translateText;
  TranslateController({
    this.rawText = '',
    this.translateText = '',
  });
}
