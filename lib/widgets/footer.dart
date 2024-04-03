import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      color: const Color(0xFF9933FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 42,
                child: Image.asset(
                  MagicStrings.tobetoLogoPath,
                ),
              ),
              Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    MagicStrings.contactUs,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Text(
              MagicStrings.tobetoFooter,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
