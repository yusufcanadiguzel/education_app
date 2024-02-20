import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.textInputType,
    required this.controller,
    this.isObscure = false,
    required this.hintText,
    required this.iconData,
    this.function,
    this.suffixIcon,
    required this.validator,
    this.onChanged,
    super.key,
  });

  final TextInputType? textInputType;
  final TextEditingController controller;
  final bool isObscure;
  final String hintText;
  final IconData iconData;
  final dynamic Function()? function;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        obscureText: isObscure,
        style: const TextStyle(color: Colors.white),
        decoration: kTextFormFieldDecoration.copyWith(
          hintText: hintText,
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
