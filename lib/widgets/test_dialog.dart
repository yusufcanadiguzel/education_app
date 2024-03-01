import 'package:education_app/screens/quiz_screen.dart';
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
      title: Text('Test Başlama Ekranı'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Bu sınav 25 sorudan oluşmakta olup sınav süresi 30 dakikadır. '
              'Sınav çoktan seçmeli test şeklinde olup sınavı yarıda bıraktığınız takdirde '
              'çözdüğünüz kısım kadarıyla değerlendirileceksiniz.',
            ),
            SizedBox(height: 20),
            Text('Sınav Süresi: 30 Dakika'),
            Text('Soru Sayısı: 25'),
            Text('Soru Tipi: Çoktan Seçmeli'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dialogu kapat
          },
          child: Text('İptal'),
        ),
        ElevatedButton(
          onPressed: _startTest, // Test başlatma işlemleri buraya gelecek
          child: Text('Teste Başla'),
        ),
      ],
    );
  }
}
