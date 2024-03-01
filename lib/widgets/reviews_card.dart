import 'package:flutter/material.dart';

enum CardType {
  FrontEnd,
  FullStack,
  BackEnd,
  MicrosoftSQLServer,
  DesktopProgramming,
  SuccessModel,
  SuccessTest,
  description,
}

class ReviewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;
  final String disclaimer;
  final CardType cardType;
  final int height;
  final void Function()? onStartButtonPressed;
  final Widget? buttonWidget;
  final bool isActive;

  const ReviewsCard({
    Key? key,
    required this.title,
    required this.description,
    this.subtitle = '',
    this.disclaimer = '',
    required this.cardType,
    required this.height,
    this.onStartButtonPressed,
    this.buttonWidget,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.toDouble(),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: cardType == CardType.description
                ? [Color.fromARGB(255, 60, 11, 140), Colors.white]
                : [const Color(0xFF3c0b8c), const Color(0xFFe3a6fe)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: cardType == CardType.description
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.0,
                  color: cardType == CardType.description
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.0,
                  color: cardType == CardType.description
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              isActive
                  ? ElevatedButton(
                      onPressed:
                          onStartButtonPressed, // Atanan geri çağırma işlevi
                      child: Text('Başla'), // Buton için metin
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 60, 11, 140),
            Color.fromARGB(255, 248, 246, 248)
          ],
        ),
      ),
      child: const Column(
        children: [
          Text(
            'Aboneliğe özel değerlendirme araçları için',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 14, 13, 13),
                height: 3),
          ),
        ],
      ),
    );
  }
}

class LastTwoCards extends StatelessWidget {
  const LastTwoCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF3c0b8c), Color(0xFFe3a6fe)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Huawei Talent Interview',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Teknik Bilgi Sınavı*',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Sertifika alabilmen için, eğitim yolculuğunun sonunda teknik yetkinliklerin ve kod bilgin ölçülür.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '4400+  soru | 30+ programlama dili | 4 zorluk seviyesi',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '*Türkiye Ar-Ge Merkezi tarafından tasarlanmıştır.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
