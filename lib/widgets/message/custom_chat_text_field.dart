import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomChatTextField extends StatelessWidget {
  const CustomChatTextField({
    required this.controller,
    this.hintText = '',
    super.key,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles.kNormalTextStyle,
      decoration: kTextFormFieldDecoration,
    );
  }
}
