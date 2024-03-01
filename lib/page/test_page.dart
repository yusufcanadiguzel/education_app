import 'package:education_app/models/test/test.dart';
import 'package:education_app/repositories/test_repository.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final TestRepository testRepository = TestRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Değerlendirme Sayfası'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Test verisini Firestore'dan çek
              Test test = await testRepository.getTest('testId');

              // Test verisini kullanarak işlemleri gerçekleştir
              // Örnek olarak, test verisini konsola yazdıralım
              print('Test Name: ${test.name}');
              print('Test Description: ${test.description}');
            } catch (e) {
              print('Hata: $e');
            }
          },
          child: Text('Test Verisini Getir'),
        ),
      ),
    );
  }
}
