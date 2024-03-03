import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/models/test/test.dart';

class TestRepository {
  final CollectionReference testCollection =
      FirebaseFirestore.instance.collection(MagicStrings.testCollectionName);

  Future<void> addTest(Test test) async {
    try {
      await testCollection.add(test.toJson());
    } catch (e) {
      print(MagicStrings.error + e.toString());
    }
  }

  Future<Test> getTest(String testId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await testCollection.doc(testId).get();
      if (documentSnapshot.exists) {
        // Firestore'dan dönen veriyi Map<String, dynamic> türüne dönüştür
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        // Dönüştürülen veriyi Test nesnesine çevir
        return Test.fromJson(data);
      } else {
        throw Exception(MagicStrings.cantFindObject);
      }
    } catch (e) {
      throw Exception(MagicStrings.cantReceiveObject + e.toString());
    }
  }
}
