import 'package:flutter/material.dart';

import '../widgets/announcement_card.dart';
import '../widgets/button.dart';
import '../widgets/footer.dart';

class TobetoScreen extends StatelessWidget {
  const TobetoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 75.0,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: 'TOBETO',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9B33FF),
                                fontSize: 26.4),
                            children: [
                              TextSpan(
                                  text: '\'ya hoş geldin',
                                  style: TextStyle(
                                      color: Color(0xFF4D4D4D), fontSize: 26.4)),
                              TextSpan(
                                text: '\nUsername',
                                style: TextStyle(
                                    color: Color(0xFF4D4D4D), fontSize: 26.4),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        'Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
              AnnouncementCard(),
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            'assets/images/istanbul_kodluyor_logo.png',
                            width: 200.0),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: const Text(
                            'Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.',
                            style:
                            TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: 'Aradığın ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF282828),
                                  fontSize: 26.4,
                                  wordSpacing: 4.0),
                              children: [
                                TextSpan(
                                    text: '"',
                                    style: TextStyle(
                                        color: Color(0xFF00d29b),
                                        fontSize: 26.4)),
                                TextSpan(
                                    text: 'İş',
                                    style: TextStyle(
                                        fontSize: 26.4,
                                        color: Color(0xFF282828))),
                                TextSpan(
                                    text: '" ',
                                    style: TextStyle(
                                        color: Color(0xFF00d29b),
                                        fontSize: 26.4)),
                                TextSpan(
                                  text: '\nBurada!',
                                  style: TextStyle(
                                      fontSize: 26.4, color: Color(0xFF282828)),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const MyButton(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
