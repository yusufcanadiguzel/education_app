import 'package:flutter/material.dart';

import '../widgets/announcement_card.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/footer.dart';
import 'package:education_app/widgets/application_screen.dart';
import 'package:education_app/widgets/education_card.dart';
import 'package:education_app/widgets/drawer_menu_widget.dart';

class TobetoScreen extends StatefulWidget {
  const TobetoScreen({Key? key}) : super(key: key);

  @override
  _TobetoScreenState createState() => _TobetoScreenState();
}

class _TobetoScreenState extends State<TobetoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TabBar(
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'Başvurularım'),
                              Tab(text: 'Eğitimlerim'),
                              Tab(text: 'Duyuru ve Haberlerim'),
                              Tab(text: 'Anketlerim'),
                            ],
                            labelColor: Colors.black,
                            indicatorColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // Başvurularım sekmesi
                              const Center(
                                child: ApplicationStatusCard(
                                  formName: 'İstanbul Kodluyor',
                                  statuses: [
                                    'İstanbul Kodluyor Başvuru Formu onaylandı.',
                                    'İstanbul Kodluyor Belge Yükleme Formu onaylandı.',
                                  ],
                                ),
                              ),

                              // Eğitimlerim sekmesi
                              Center(
                                child: ListView.builder(
                                  itemCount: EducationCard.educations.length,
                                  itemBuilder: (context, index) {
                                    return EducationCard(
                                      title:
                                          EducationCard.educations[index].title,
                                      imageUrl: EducationCard
                                          .educations[index].imageUrl,
                                      date:
                                          EducationCard.educations[index].date,
                                      onPressed: () {
                                        // Eğitim detaylarını göstermek için bir işlev
                                      },
                                    );
                                  },
                                ),
                              ),

                              // Duyuru ve Haberlerim sekmesi
                              Container(
                                color: Colors.yellow,
                                // Bu sekmenin içeriğini doldurulabilir
                              ),

                              // Anketlerim sekmesi
                              Container(
                                color: Colors.green,
                                // Bu sekmenin içeriğini doldurulabilir
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Daha fazla göster butonu
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Daha fazla göster butonuna basıldığında yapılacak işlemler
                },
                child: const Text('Daha Fazla Göster'),
              ),
            ),
            // Footer
            const MyButton(),
            const Footer(),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
