//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

//class QuizScreen extends StatefulWidget {
// @override
// _QuizScreenState createState() => _QuizScreenState();
//}

//class _QuizScreenState extends State<QuizScreen> {
// late Timer _timer;
//int _remainingTime = 1800; // Toplam 30 dakika, saniye cinsinden
// String jotformUrl = 'https://form.jotform.com/240632453174957';

// @override
// void initState() {
//  super.initState();
//   _startTimer();
// }

// @override
// void dispose() {
//   _timer.cancel();
//   super.dispose();
// }

//void _startTimer() {
//  const oneSecond = Duration(seconds: 1);
// _timer = Timer.periodic(oneSecond, (timer) {
//     if (_remainingTime == 0) {
//      timer.cancel();
//       // Zaman bittiğinde yapılacak işlemler
//     } else {
//      setState(() {
//         _remainingTime--;
//        });
//      }
//    });
//  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Değerlendirme Sayfası'),
//     ),
//     body: Container(
//      color: Colors.white,
//        padding: const EdgeInsets.all(16.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                const Text(
//                  '1/1',
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black,
//                  ),
//                ),
//                Text(
//                 '${_remainingTime ~/ 60}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
//                  style: const TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black,
//                  ),
//                ),
//              ],
//            ),
//           const SizedBox(height: 16.0),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                const Text(
//                  'Teste başlamak için aşağıdaki butona tıklayın:',
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black,
//                  ),
//               ),
//                const SizedBox(height: 16.0),
//                ElevatedButton(
//                  onPressed: () {
//                    _launchJotformUrl();
//                  },
//                  child: const Text('Teste Başla'),
//               ),
//
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
// }

// void _launchJotformUrl() async {
//   const url = 'https://form.jotform.com/240632453174957';
    // ignore: deprecated_member_use
//    if (await canLaunch(url)) {
//     // ignore: deprecated_member_use
//      await launch(url);
//    } else {
//     throw 'Could not launch $url';
//    }
//  }
//}
