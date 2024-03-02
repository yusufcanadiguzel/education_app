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
        'Test Başlama Ekranı',
        style: TextStyles.kHeaderTextStyle,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Bu sınav 25 sorudan oluşmakta olup sınav süresi 30 dakikadır. '
              'Sınav çoktan seçmeli test şeklinde olup sınavı yarıda bıraktığınız takdirde '
              'çözdüğünüz kısım kadarıyla değerlendirileceksiniz.',
              style: TextStyles.kListTileDescriptionTextStyle,
            ),
            SizedBox(height: 20),
            Text(
              'Sınav Süresi: 30 Dakika',
              style: TextStyles.kListTileDescriptionTextStyle,
            ),
            Text(
              'Soru Sayısı: 25',
              style: TextStyles.kListTileDescriptionTextStyle,
            ),
            Text(
              'Soru Tipi: Çoktan Seçmeli',
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
          child: Text('İptal', style: TextStyles.kListTileHeaderTextStyle),
        ),
        CustomActionButton(
          function: _startTest,
          buttonText: 'Teste Başla',
          width: 150.0,
        ),
      ],
    );
  }
}
