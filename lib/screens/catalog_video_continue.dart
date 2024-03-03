import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/models/course.dart';
import 'package:education_app/screens/video_play.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogVideoContinue extends StatefulWidget {
  CatalogVideoContinue({Key? key, required this.catalogCard}) : super(key: key);
  CoursesCard catalogCard;

  @override
  _CatalogContinueState createState() => _CatalogContinueState();
}

class _CatalogContinueState extends State<CatalogVideoContinue> {
  String currentImage = MagicStrings.tobetoLogoPath;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catalogCard.coursesName, style: TextStyles.kHeaderTextStyle),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: phoneWidth / 1.1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
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
                      color: const Color.fromARGB(255, 246, 246, 246),
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
                                    Color.fromARGB(255, 124, 17, 177),
                                    Color.fromARGB(255, 148, 110, 209),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (currentText ==
                                      MagicStrings.listenUnderstand) {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (ctx) => LessonVideo(
                                            videoUrl:
                                                MagicStrings.videoUrl)));
                                  }
                                  if (currentImage ==
                                      MagicStrings.tobeto2LogoPath) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => LessonVideo(
                                                videoUrl: widget
                                                    .catalogCard.videoUrl)));
                                  }
                                  if (currentText ==
                                      MagicStrings.communicationBasics) {
                                    _launchURL();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      const Color.fromARGB(0, 95, 20, 200),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                  minimumSize: Size(
                                    phoneWidth / 1.3,
                                    30,
                                  ), //////// HERE
                                ),
                                child: Text(MagicStrings.goEducation),
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
                    title: MagicStrings.beforeStart,
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = MagicStrings.tobetoLogoPath;
                            currentText = widget.catalogCard.coursesName;
                          });
                        },
                        child: Text(widget.catalogCard.coursesName),
                      ),
                    ],
                  ),
                  MyAccordionTile(
                    title: MagicStrings.firstModule,
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = MagicStrings.tobetoLogoPath;
                            currentText =
                                MagicStrings.communicationBasics;
                          });
                        },
                        child: Text(
                          MagicStrings.communicationBasics,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = MagicStrings.tobetoLogoPath;
                            currentText =
                                MagicStrings.communicationBasics;
                          });
                        },
                        child: Text(MagicStrings.communicationBasics),
                      ),
                    ],
                  ),
                  MyAccordionTile(
                    title: MagicStrings.secondModule,
                    content: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentImage = MagicStrings.tobeto2LogoPath;
                            currentText =
                                MagicStrings.communicationProblems;
                          });
                        },
                        child: Text(
                          MagicStrings.communicationProblems,
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
    String url =
        MagicStrings.videoUrl2;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw MagicStrings.couldNotLaunch + url;
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
          dividerColor: const Color.fromRGBO(255, 255, 255, 1),
          unselectedWidgetColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(fontFamily: MagicStrings.raleway),
          ),
          collapsedTextColor: Colors.black,
          textColor: Colors.black,
          iconColor: Colors.black,
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
