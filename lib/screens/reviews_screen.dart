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
        title: const Text('Değerlendirmeler'),
      ),
      body: ListView(
        children: [
          const ReviewsCard(
            title: 'Tobeto İşte başarı Modeli',
            subtitle: '80 soru ile yetkinliklerini ölç,',
            description: 'önerilen eğitimleri tamamla, \nrozetini kazan.',
            cardType: CardType.description,
            height: 165,
            isActive: false,
          ),
          const ReviewsCard(
            title: 'Yazılımda Başarı Testi',
            subtitle: 'Çoktan seçmeli',
            description: 'sorular ile teknik bilgini \ntest et',
            cardType: CardType.description,
            height: 165,
            isActive: false,
          ),
          ReviewsCard(
            title: 'Front End',
            description: 'Front End kartının açıklaması',
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
            title: 'Full Stack',
            description: 'Full Stack kartının açıklaması',
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
            title: 'Back End',
            description: 'Back End kartının açıklaması',
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
            title: 'Microsoft SQL Server',
            description: 'Microsoft SQL Server kartının açıklaması',
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
            title: 'Masaüstü Programlama',
            description: 'Masaüstü Programlama kartının açıklaması',
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
          const Footer(),
        ],
      ),
    );
  }
}
