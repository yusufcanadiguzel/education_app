import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(MagicStrings.messageScreen),
      ),
    );
  }
}
