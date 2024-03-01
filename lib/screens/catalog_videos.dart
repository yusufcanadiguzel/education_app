import 'dart:ui';

import 'package:education_app/models/course.dart';
import 'package:education_app/screens/catalog_video_continue.dart';
import 'package:flutter/material.dart';

class CatalogVideos extends StatefulWidget {
  CatalogVideos({Key? key, required this.courseCard}) : super(key: key);
  CoursesCard courseCard;

  @override
  _CatalogVideosState createState() => _CatalogVideosState();
}

class _CatalogVideosState extends State<CatalogVideos> {
  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: phoneWidth / 20, vertical: phoneHeight / 35),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          onTap: () {
            if (widget.courseCard.releaseDate == '4s 14dk') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CatalogVideoContinue(
                          catalogCard: widget.courseCard,
                        )),
              );
            }
            // if (widget.courseCard.releaseDate == "40dk") {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => CatalogContinue2(
            //               catalogCard: widget.catalogCard,
            //             )),
            //   );
            // }
          },
          child: Stack(
            children: [
              Image.network(
                widget.courseCard.imageUrl,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Container(
                  width: phoneWidth,
                  child: ClipRect(
                    // ClipRect ile boyutları sınırla
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(192, 166, 114, 226)
                              .withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: phoneWidth / 90),
                                    Text(
                                      widget.courseCard.educatorName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    SizedBox(width: phoneWidth / 70),
                                    const Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                      size: 19,
                                    ),
                                    SizedBox(width: phoneWidth / 90),
                                    Text(
                                      widget.courseCard.releaseDate,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                width: phoneWidth / 1.3,
                                child: Text(
                                  widget.courseCard.coursesName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 15.0,
                  right: 15.0,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle,
                        color: Color.fromARGB(255, 201, 24, 232),
                        size: 40,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
