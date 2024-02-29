import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final List<CoursesCard> courseList;

  CourseModel({required this.courseList});

  factory CourseModel.fromCatalogFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final List<dynamic>? videosList = snapshot.data()?['coursesCard'];
    print("videosList: $videosList");
    if (videosList == null) {
      return CourseModel(courseList: []);
    }
    List<CoursesCard> videos = videosList.map((videoMap) {
      return CoursesCard(
        coursesName: videoMap['coursesName'] as String,
        videoUrl: videoMap['videoUrl'] as String,
        educatorName: videoMap['educatorName'] as String,
        imageUrl: videoMap['imageUrl'] as String,
        releaseDate: videoMap['releaseDate'] as String,
      );
    }).toList();

    return CourseModel(courseList: videos);
  }
}

class CoursesCard {
  final String coursesName;

  final String educatorName;

  final String imageUrl;

  final String releaseDate;

  final String videoUrl;

  CoursesCard(
      {required this.coursesName,
      required this.educatorName,
      required this.imageUrl,
      required this.releaseDate,
      required this.videoUrl});
}
