import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({required this.dividerText, super.key});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //Divider ya da
      child: Row(
        children: [
          const Expanded(
            child: Divider(thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              MagicStrings.or,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
