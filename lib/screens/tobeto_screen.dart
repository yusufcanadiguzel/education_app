import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';
import '../widgets/announcement_card.dart';
import 'package:education_app/widgets/button.dart';
import 'package:education_app/widgets/footer.dart';
import 'package:education_app/widgets/application_screen.dart';
import 'package:education_app/widgets/education_card.dart';

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
                              fontSize: 26.4),
                          children: [
                            TextSpan(
                                text: MagicStrings.welcomeTo,
                                style: const TextStyle(
                                    color: Color(0xFF4D4D4D), fontSize: 26.4)),
                            TextSpan(
                              text: MagicStrings.username,
                              style: const TextStyle(
                                  color: Color(0xFF4D4D4D), fontSize: 26.4),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      MagicStrings.tobetoSlogan,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18.0),
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
                          MagicStrings.istanbulCodingLogoPath,
                          width: 200.0),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Text(
                          MagicStrings.freeEducationSlogan,
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: MagicStrings.poppins),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                    ),
                    Column(
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
                                child: ApplicationStatusCard(
                                  formName: MagicStrings.istanbulCoding,
                                  statuses: [
                                    MagicStrings.istanbulCodingApplicationAccept,
                                    MagicStrings.istanbulCodingFilesAccept,
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
                child: Text(MagicStrings.showMore),
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
