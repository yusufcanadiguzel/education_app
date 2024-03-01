import 'package:education_app/models/course.dart';
import 'package:education_app/screens/video_play.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogVideoContinue extends StatefulWidget {
  CatalogVideoContinue({Key? key, required this.catalogCard}) : super(key: key);
  CoursesCard catalogCard;

  @override
  _CatalogContinueState createState() => _CatalogContinueState();
}

class _CatalogContinueState extends State<CatalogVideoContinue> {
  String currentImage = "assets/images/tobeto.jpg";
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catalogCard.coursesName),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: phoneWidth / 1.1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.13),
                  blurRadius: 29.0,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: phoneHeight / 70,
                  ),
                  Container(
                    width: phoneWidth / 1.2,
                    height: phoneHeight / 3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 246, 246, 246),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.218),
                          blurRadius: 20.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            // fotoğrafın kenarlarına radius verdim
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            child: AspectRatio(
                              aspectRatio: 4 / 2,
                              child: Image.asset(
                                currentImage,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(height: phoneHeight / 80),
                          Padding(
                            padding: EdgeInsets.only(left: phoneWidth / 40),
                            child: Text(
                              currentText.isEmpty
                                  ? widget.catalogCard.coursesName
                                  : currentText,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: phoneHeight / 40,
                          ),
                          Center(
                            child: Container(
                              width: phoneWidth / 1.3,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [0.005, 1.0],
                                  colors: [
                                    Color(0xFF0E0B93),
                                    Color(0xFF5EB6CA),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (currentText ==
                                      "Dinle,Anla,İfade Et: Etkili Gelişim Yolculuğu") {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (ctx) => const LessonVideo(
                                            videoUrl:
                                                "assets/video/tobeto_video.mp4")));
                                  }
                                  if (currentImage ==
                                      "assets/images/tobeto_2.jpg") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => LessonVideo(
                                                videoUrl: widget
                                                    .catalogCard.videoUrl)));
                                  }
                                  if (currentText ==
                                      "İletişimin Temelleri ve İletişim Tipleri") {
                                    _launchURL();
                                  }
                                },
                                child: Text("Eğitime Git"),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  minimumSize: Size(
                                    phoneWidth / 1.3,
                                    30,
                                  ), //////// HERE
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: phoneHeight / 40,
                  ),
                  MyAccordionTile(
                    title: 'Başlamadan Önce',
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "assets/images/tobeto.jpg";
                            currentText = widget.catalogCard.coursesName;
                          });
                        },
                        child: Text(widget.catalogCard.coursesName),
                      ),
                    ],
                  ),
                  MyAccordionTile(
                    title: '1. Modül: Bilgilen',
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "assets/images/tobeto.jpg";
                            currentText =
                                "İletişimin Temelleri ve İletişim Tipleri";
                          });
                        },
                        child: Text(
                          'İletişimin Temelleri ve İletişim Tipleri',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "assets/images/tobeto.jpg";
                            currentText =
                                "İletişim Engelleri Sizi Engellemesin";
                          });
                        },
                        child: Text('İletişim Engelleri Sizi Engellemesin'),
                      ),
                    ],
                  ),
                  MyAccordionTile(
                    title: '2. Modül: Uzmanına Kulak Ver',
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = "assets/images/tobeto_2.jpg";
                            currentText =
                                "İletişimde Sorun Çıkartmanın Garantili Yolları";
                          });
                        },
                        child: Text(
                          'İletişimde Sorun Çıkartmanın Garantili Yolları',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://lms.tobeto.com/tobeto/eep/content/cdn-enocta/8702/start.html?project_path=https://lms.tobeto.com/tobeto/eep/content/cdn-enocta/8702/&compability=AICC&config_path=&AICC_URL=https://lms.tobeto.com/tobeto/eep/aicc2.aspx&pageID=&secParamLMS=C6S9SWH4r3LwryhSUcz6CZlioAAYKcdsLdpj1KZDxQQ%3d&AICC_SID=1826820&isSubtitle=0';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class MyAccordionTile extends StatefulWidget {
  final String title;
  final List<Widget> content;

  MyAccordionTile({
    required this.title,
    required this.content,
  });

  @override
  _MyAccordionTileState createState() => _MyAccordionTileState();
}

class _MyAccordionTileState extends State<MyAccordionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
      child: Theme(
        // ExpansionTile'ın temasını değiştirmek için
        data: ThemeData(
          dividerColor: Colors.white,
          unselectedWidgetColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(fontFamily: "Raleway"),
          ),
          collapsedTextColor: Colors.black, // Açılmamış durumdaki metin rengi
          textColor: Colors.black, // Açık durumdaki metin rengi
          iconColor: Colors.black, // Açılmamış durumdaki simge rengi
          collapsedIconColor: Colors.black,
          onExpansionChanged: (isExpanded) {
            setState(() {
              _isExpanded = isExpanded;
            });
          },
          initiallyExpanded: _isExpanded,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
