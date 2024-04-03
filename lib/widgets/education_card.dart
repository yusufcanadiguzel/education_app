import 'package:flutter/material.dart';
import 'package:education_app/constants/strings/magic_strings.dart';

class EducationCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String date;
  final VoidCallback onPressed;

  const EducationCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.onPressed,
  }) : super(key: key);

  static final List<EducationData> educations = [
    EducationData(
      title: MagicStrings.educationCardTitle,
      imageUrl: MagicStrings.educationCardImageUrl,
      date: MagicStrings.educationCardDate,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151A3C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Geri dönüş işlemi
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter, // Kartı ekranın en üstünde hizala
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0), // Kartı biraz aşağıya al
          child: SizedBox(
            width: double.infinity,
            height: 320.0,
            child: Card(
              color: const Color(0xFF151A3C),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: const Border(
                    left: BorderSide(
                      width: 0.01,
                      color: Colors.green,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 184.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(educations[0].imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              educations[0].title,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 252, 251, 251),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              educations[0].date,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 252, 251, 251),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: onPressed,
                                    child: Text(MagicStrings.goEducation),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EducationData {
  final String title;
  final String imageUrl;
  final String date;

  EducationData({
    required this.title,
    required this.imageUrl,
    required this.date,
  });
}
