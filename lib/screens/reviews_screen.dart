import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/test_dialog.dart';
import 'package:flutter/material.dart';
import 'package:education_app/widgets/reviews_card.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MagicStrings.reviews,
          style: TextStyles.kHeaderTextStyle,
        ),
      ),
      body: ListView(
        children: [
          ReviewsCard(
            title: MagicStrings.tobetoSuccessModel,
            subtitle: MagicStrings.eightyQuestion,
            description: MagicStrings.suggestedEducations,
            cardType: CardType.description,
            height: 165,
            isActive: false,
          ),
          ReviewsCard(
            title: MagicStrings.developmentSuccess,
            subtitle: MagicStrings.multipleChoice,
            description: MagicStrings.checkYourTechnic,
            cardType: CardType.description,
            height: 165,
            isActive: false,
          ),
          ReviewsCard(
            title: MagicStrings.frontEnd,
            description: MagicStrings.frontEndCardExplain,
            cardType: CardType.description,
            height: 170,
            onStartButtonPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TestDialog(testUrl: 'https://form.jotform.com/240632453174957');
                },
              );
            },
          ),
          ReviewsCard(
            title: MagicStrings.fullStack,
            description: MagicStrings.fullStackCardExplain,
            cardType: CardType.description,
            height: 170,
            onStartButtonPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TestDialog(testUrl: 'https://form.jotform.com/240814435117956');
                },
              );
            },
          ),
          ReviewsCard(
            title: MagicStrings.backEnd,
            description: MagicStrings.backEndCardExplain,
            cardType: CardType.description,
            height: 170,
            onStartButtonPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TestDialog(testUrl: 'https://form.jotform.com/240814713652959');
                },
              );
            },
          ),
          ReviewsCard(
            title: MagicStrings.msSqlServer,
            description: MagicStrings.msqSqlServerCardExplain,
            cardType: CardType.description,
            height: 170,
            onStartButtonPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TestDialog(testUrl: 'https://form.jotform.com/240813867281966');
                },
              );
            },
          ),
          ReviewsCard(
            title: MagicStrings.dekstopProgramming,
            description: MagicStrings.desktopProgrammingCardExplain,
            cardType: CardType.description,
            height: 170,
            onStartButtonPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TestDialog(testUrl: 'https://form.jotform.com/240814577673970');
                },
              );
            },
          ),
          CustomSectionWidget(),
          const LastTwoCards(),
        ],
      ),
    );
  }
}
