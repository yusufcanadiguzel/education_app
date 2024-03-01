import 'package:flutter/material.dart';

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
      title: 'Mobil Geliştirici (Flutter)-1A',
      imageUrl: 'assets/images/Paragraf_metniniz_5_ee4ce53c20.png',
      date: '23 Ekim 2023 03:00',
    ),
    // Diğer eğitim örnekleri...
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        height: 310.0, // Kartın yüksekliğini ayarla
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: const Border(
                left: BorderSide(
                  width: 0.01, // Border kalınlığını ayarla
                  color: Colors.green,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 184.0, // Resmin yüksekliğini ayarla
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(educations[0].imageUrl),
                      fit: BoxFit.cover, // Resmin nasıl sığdırılacağını belirle
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
                            fontSize: 16.0, // Başlığın font boyutunu ayarla
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 10, 10, 10),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          educations[0].date,
                          style: const TextStyle(
                            fontSize: 12.0, // Tarihin font boyutunu ayarla
                            color: Color.fromARGB(255, 10, 10, 10),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: onPressed,
                                child: const Text('Eğitime Git'),
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
