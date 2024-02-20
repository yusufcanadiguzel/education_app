import 'package:flutter/material.dart';

class CustomConnectionButton extends StatelessWidget {
  const CustomConnectionButton({required this.iconData, this.function, super.key});

  final IconData? iconData;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: IconButton(
          onPressed: function,
          icon: Icon(iconData,
              size: 40.0,
          color: Colors.white),
        ),
      ),
    );
  }
}
