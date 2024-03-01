import 'dart:async';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Timer _timer;
  int _remainingTime = 1800; // Toplam 30 dakika, saniye cinsinden

  List<Question> questions = [
    Question(
      text:
          'Bir sınıf içindeki virtual (sanal) metodun davranışını değiştirmek için yapılması gereken işlem için kullanılması gereken anahtar kelime nedir?',
      correctAnswer: 'override (geçersiz kılmak)',
      options: [
        'override (geçersiz kılmak)',
        'virtual (sanallaştırma)',
        'inheritance (miras alma)',
        'private (özel\'e alma)'
      ],
    ),
    // Diğer sorular...
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        // Zaman bittiğinde yapılacak işlemler
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Değerlendirme Sayfası'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1/${questions.length}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${_remainingTime ~/ 60}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questions[0].text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  children: List.generate(questions[0].options.length, (index) {
                    return OptionWidget(
                      text: questions[0].options[index],
                      isCorrect: questions[0].options[index] ==
                          questions[0].correctAnswer,
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Önceki soruya git
                  },
                  child: Text('Önceki Soru'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Sonraki soruya git
                  },
                  child: Text('Sonraki Soru'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String text;
  final bool isCorrect;

  OptionWidget({required this.text, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Seçilen şık için işlemler buraya gelecek
        if (isCorrect) {
          // Doğru cevap
        } else {
          // Yanlış cevap
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final String correctAnswer;
  final List<String> options;

  Question(
      {required this.text, required this.correctAnswer, required this.options});
}
