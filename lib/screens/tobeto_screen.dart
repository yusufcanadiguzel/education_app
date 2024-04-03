import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';
import '../widgets/announcement_card.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/footer.dart';
import 'package:education_app/widgets/application_screen.dart';
import 'package:education_app/widgets/education_card.dart';
import 'package:education_app/widgets/dual_education_cards.dart';

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
                        text: TextSpan(
                          text: MagicStrings.tobeto,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9B33FF),
                            fontSize: 26.4,
                          ),
                          children: [
                            TextSpan(
                              text: MagicStrings.welcomeTo,
                              style: const TextStyle(
                                color: Color(0xFF4D4D4D),
                                fontSize: 26.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        MagicStrings.tobetoSlogan,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnnouncementCard(),
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF151A3C), // Belirttiğiniz renk
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                MagicStrings.istanbulCodingLogoPath,
                                width: 200.0,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              MagicStrings.freeEducationSlogan,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: MagicStrings.poppins,
                                color: Colors.white, // Yazının rengi beyaz
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xFF151A3C), // Arka plan rengi
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: TabBar(
                                controller: _tabController,
                                tabs: [
                                  Tab(text: MagicStrings.myApplications),
                                  Tab(text: MagicStrings.myEducations),
                                  Tab(text: MagicStrings.myAnnouncementsAndNews),
                                  Tab(text: MagicStrings.mySurveys),
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
                                  Center(
                                    child: Container(
                                      color: const Color(0xFF151A3C), // Arka plan rengi
                                      child: ApplicationStatusCard(
                                        formName: MagicStrings.istanbulCoding,
                                        statuses: [
                                          MagicStrings.istanbulCodingApplicationAccept,
                                          MagicStrings.istanbulCodingFilesAccept,
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Eğitimlerim sekmesi
                                  DualEducationCards(
                                    title1: 'Senkron Dersler',
                                    title2: 'Asenkron Dersler',
                                    onPressed1: () {
                                      // Senkron dersler butonuna basıldığında yapılacak işlemler
                                      print('Senkron Dersler butonuna basıldı');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EducationCard(
                                            title: 'Senkron Dersler',
                                            imageUrl: 'assets/senkron_dersler_image.png',
                                            date: '22.04.2024', // Örnek tarih
                                            onPressed: () {
                                              // İçeriğe Git butonuna basıldığında yapılacak işlemler
                                              print('İçeriğe Git butonuna basıldı');
                                              // Burada ilgili içeriğe gitmek için gerekli işlemleri yapabilirsiniz
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    onPressed2: () {
                                      // Asenkron dersler butonuna basıldığında yapılacak işlemler
                                      print('Asenkron Dersler butonuna basıldı');
                                      // İlgili işlemler
                                    },
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
                  child: Text(MagicStrings.showMore),
                ),
              ),
              // Footer
              const MyButton(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
