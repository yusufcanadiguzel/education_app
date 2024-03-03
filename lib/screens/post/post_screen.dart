import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(MagicStrings.postScreen),
      ),
    );
  }
}
