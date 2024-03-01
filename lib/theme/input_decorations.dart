import 'package:education_app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  InputDecorations({required this.hintText});

  final String hintText;

  static InputDecoration kTextFormFieldDecoration = InputDecoration(
    hintStyle: TextStyles.kNormalTextStyle,
    labelStyle: TextStyles.kNormalTextStyle,
    fillColor: const Color(0xFF151A3C),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.white),
    ),
  );
}
