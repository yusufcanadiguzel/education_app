import 'package:education_app/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class KFormInput extends StatelessWidget {
  const KFormInput(
      {required this.iconData,
      required this.labelText,
      this.isObscure = false,
      super.key});

  final String labelText;
  final IconData iconData;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: kTextFormFieldDecoration.copyWith(
        labelText: labelText,
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(iconData),
        ),
      ),
    );
  }
}
