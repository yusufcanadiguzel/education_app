import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/models/course.dart';
import 'package:education_app/screens/catalog_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CatalogRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CourseModel> getCourseInfo() async {
    final coursesFromDb = await _firestore
        .collection(MagicStrings.coursesCollectionName)
        .doc(MagicStrings.catalogRepositoryDoc)
        .get();

    final coursesCardInfo = CourseModel.fromCatalogFireStore(coursesFromDb);

    return coursesCardInfo;
  }
}
