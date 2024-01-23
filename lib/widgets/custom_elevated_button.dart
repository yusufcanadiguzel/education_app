import 'package:flutter/material.dart';
import 'package:education_app/constants/colors.dart' as kcolors;

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({required this.buttonText, required this.onPressed, super.key});

  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kcolors.Colors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0),),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: const TextStyle(color: Colors.white,),),
    );
  }
}
