import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/models/test/test.dart';
import 'package:education_app/repositories/test_repository.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final TestRepository testRepository = TestRepository();

  TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MagicStrings.reviewScreen),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Test verisini Firestore'dan çek
              Test test = await testRepository.getTest(MagicStrings.testId);

              // Test verisini kullanarak işlemleri gerçekleştir
              // Örnek olarak, test verisini konsola yazdıralım
              print(MagicStrings.testName + test.name);
              print(MagicStrings.testDescription + test.description);
            } catch (e) {
              print(MagicStrings.error + e.toString());
            }
          },
          child: Text(MagicStrings.getTestData),
        ),
      ),
    );
  }
}
