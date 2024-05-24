import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../../themes/theme_config.dart';

class TranslateImgScreen extends StatefulWidget {
  const TranslateImgScreen({Key? key}) : super(key: key);

  @override
  State<TranslateImgScreen> createState() => _TranslateImgScreenState();
}

class _TranslateImgScreenState extends State<TranslateImgScreen> {
  File? filePicked;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          children: [
            if (filePicked != null)
              Image.file(
                filePicked!,
                height: 100,
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
                    'Pick Image',
                    style: CustomTextStyle.boldStandard(
                      color: TextColors.textWhite,
                    ),
                  ),
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(type: FileType.any);
                    if (result != null) {
                      PlatformFile file = result.files.first;
                      filePicked = File(file.path!);
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
            if (filePicked != null)
              FutureBuilder<String?>(
                future: _textRecognition(filePicked!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? '',
                      style: CustomTextStyle.boldStandard(
                        color: TextColors.textHighEm,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
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
