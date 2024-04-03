import 'package:flutter/material.dart';

class DualEducationCards extends StatelessWidget {
  final String title1;
  final String title2;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  const DualEducationCards({
    Key? key,
    required this.title1,
    required this.title2,
    required this.onPressed1,
    required this.onPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: const Color(0xFF151A3C),
          child: InkWell(
            onTap: onPressed1,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onPressed1,
                      child: Text(
                        'İçeriğe Git',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: const Color(0xFF151A3C),
          child: InkWell(
            onTap: onPressed2,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title2,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onPressed2,
                      child: Text(
                        'İçeriğe Git',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
