import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    required this.function,
    required this.buttonText,
    this.width = 200,
    super.key,
  });

  final Function()? function;
  final String buttonText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 25.0),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      onPressed: function,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Color(0xFF1D3566),
        ),
      ),
    );
  }
}
