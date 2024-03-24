import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestDialog extends StatelessWidget {
  final String testUrl;

  const TestDialog({Key? key, required this.testUrl}) : super(key: key);

  void _startTest(BuildContext context) async {
    Navigator.of(context).pop(); // Dialogu kapat
    await _launchTestUrl(testUrl); // Testi başlat
  }

  Future<void> _launchTestUrl(String url) async {
    Uri uri = Uri.parse(url);
    // ignore: deprecated_member_use
    if (await canLaunch(uri.toString())) {
      // ignore: deprecated_member_use
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF151A3C),
      title: Text(
        MagicStrings.testStartScreen,
        style: TextStyle(color: Colors.white), // Başlık rengi değiştirildi
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              MagicStrings.huaweiTestInfo,
              style: TextStyle(color: Colors.white), // Metin rengi değiştirildi
            ),
            const SizedBox(height: 20),
            Text(
              MagicStrings.testLenght,
              style: TextStyle(color: Colors.white), // Metin rengi değiştirildi
            ),
            Text(
              MagicStrings.testQuestionLenght,
              style: TextStyle(color: Colors.white), // Metin rengi değiştirildi
            ),
            Text(
              MagicStrings.testQuestionType,
              style: TextStyle(color: Colors.white), // Metin rengi değiştirildi
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dialogu kapat
          },
          child: Text(
            MagicStrings.cancel,
            style: TextStyle(color: Colors.white), // Metin rengi değiştirildi
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _startTest(context); // Testi başlat
          },
          child: Text(
            MagicStrings.startTest,
            style: TextStyle(color: Colors.white), // Metin rengi değiştirildi
          ),
        ),
      ],
    );
  }
}
