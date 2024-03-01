import 'package:education_app/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({required this.text, required this.isSender, super.key});

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
            color: isSender ? const Color(0xFFFF0067) : const Color(0xFF272A4D),
            borderRadius: isSender
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )
                : const BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: TextStyles.kNormalTextStyle,),
          ),
        ),
      ],
    );
  }
}
