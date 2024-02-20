import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({required this.dividerText, super.key});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      //Divider ya da
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'ya da',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
