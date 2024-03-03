import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/screens/quiz_screen.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class TestDialog extends StatefulWidget {
  const TestDialog({Key? key}) : super(key: key);

  @override
  _TestDialogState createState() => _TestDialogState();
}

class _TestDialogState extends State<TestDialog> {
  void _startTest() {
    Navigator.of(context).pop(); // Dialogu kapat
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuizScreen())); // QuizScreen'e git
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF151A3C),
      title: Text(
        MagicStrings.testStartScreen,
        style: TextStyles.kHeaderTextStyle,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              MagicStrings.huaweiTestInfo,
              style: TextStyles.kListTileDescriptionTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              MagicStrings.testLenght,
              style: TextStyles.kListTileDescriptionTextStyle,
            ),
            Text(
              MagicStrings.testQuestionLenght,
              style: TextStyles.kListTileDescriptionTextStyle,
            ),
            Text(
              MagicStrings.testQuestionType,
              style: TextStyles.kListTileDescriptionTextStyle,
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
            style: TextStyles.kListTileHeaderTextStyle,
          ),
        ),
        CustomActionButton(
          function: _startTest,
          buttonText: MagicStrings.startTest,
          width: 150.0,
        ),
      ],
    );
  }
}
