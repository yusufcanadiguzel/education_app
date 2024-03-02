import 'package:education_app/constants/decorations/container_decorations.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/custom_action_button.dart';
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
    return SingleChildScrollView(
      child: Container(
        height: height.toDouble(),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Container(
          decoration: ContainerDecorations.listContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyles.kListTileHeaderTextStyle,
                ),
                const SizedBox(height: 8.0),
                Text(
                  subtitle,
                  style: TextStyles.kListTileDescriptionTextStyle,
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyles.kListTileDescriptionTextStyle,
                ),
                isActive
                    ? CustomActionButton(
                        function: onStartButtonPressed, buttonText: 'Başla')
                    : Container(),
              ],
            ),
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
      decoration: ContainerDecorations.listContainerDecoration,
      child: const Column(
        children: [
          Text(
            'Aboneliğe özel değerlendirme araçları için',
            style: TextStyles.kNormalTextStyle,
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
      decoration: ContainerDecorations.listContainerDecoration,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Huawei Talent Interview',
            style: TextStyles.kHeaderTextStyle,
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
