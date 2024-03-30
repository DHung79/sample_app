import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../../apis/configs/rest/rest_api_handler_data.dart';
import '../../../themes/theme_config.dart';
import '../packages/flutter_scalable_ocr.dart';

class TranslateOCRScreen extends StatefulWidget {
  const TranslateOCRScreen({super.key});

  @override
  State<TranslateOCRScreen> createState() => _TranslateOCRScreenState();
}

class _TranslateOCRScreenState extends State<TranslateOCRScreen> {
  String text = '';
  String translateText = '';
  final StreamController<String> controller = StreamController<String>();

  void setText(value) {
    controller.add(value);
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
                boxHeight: MediaQuery.of(context).size.height / 3,
                getRawData: (value) {
                  inspect(value);
                },
                getScannedText: (value) {
                  setText(value);
                }),
            StreamBuilder<String>(
              stream: controller.stream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                final streamText = snapshot.data != null ? snapshot.data! : "";
                text = streamText;
                return Text("Readed text: $streamText");
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Translate to Vietnamese',
                    style: CustomTextStyle.boldStandard(
                      color: TextColors.textWhite,
                    ),
                  ),
                  onPressed: () async {
                    translateText = await translate(text);
                    setState(() {});
                  },
                ),
              ),
            ),
            if (translateText.isNotEmpty)
              Text("Translate text: $translateText"),
          ],
        ),
      ),
    );
  }

  Future<String?> _textRecognition(File file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final inputImage = InputImage.fromFile(file);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    textRecognizer.close();
    return text;
    // for (TextBlock block in recognizedText.blocks) {
    //   final Rect rect = block.boundingBox;
    //   final List<Point<int>> cornerPoints = block.cornerPoints;
    //   final String text = block.text;
    //   final List<String> languages = block.recognizedLanguages;

    //   for (TextLine line in block.lines) {
    //     // Same getters as TextBlock
    //     for (TextElement element in line.elements) {
    //       // Same getters as TextBlock
    //     }
    //   }
    // }
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
    logDebug('path: $path');
    logDebug('response: ${response}');
    final data = response[0];

    data.forEach((element) {
      result += element[0];
    });
  } catch (e) {
    result = text;
  }
  logDebug('result: $result');
  return result;
}
