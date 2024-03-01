import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/test/test.dart';

class TestRepository {
  final CollectionReference testCollection =
      FirebaseFirestore.instance.collection('tests');

  Future<void> addTest(Test test) async {
    try {
      await testCollection.add(test.toJson());
    } catch (e) {
      print('Hata: $e');
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
        throw Exception('Belirtilen test bulunamadı.');
      }
    } catch (e) {
      throw Exception('Test getirilirken bir hata oluştu: $e');
    }
  }
}
