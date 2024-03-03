import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/test_dialog.dart';
import 'package:flutter/material.dart';
import 'package:education_app/widgets/reviews_card.dart';
import 'package:education_app/widgets/footer.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

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
                  return const TestDialog();
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
                  return const TestDialog();
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
                  return const TestDialog();
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
                  return const TestDialog(); // TestDialog widget'ını göster
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
                  return const TestDialog(); // TestDialog widget'ını göster
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
