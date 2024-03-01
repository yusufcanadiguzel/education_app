import 'dart:developer';
import 'package:education_app/models/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/message/send_message_bloc/send_message_bloc.dart';
import '../../blocs/message/send_message_bloc/send_message_event.dart';
import 'custom_chat_text_field.dart';

class MessageField extends StatefulWidget {
  const MessageField(
      {required this.senderId, required this.receiverId, super.key});

  final String senderId;
  final String receiverId;

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomChatTextField(
            controller: _messageController,
            hintText: 'Mesaj',
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        IconButton(
          onPressed: () {
            if(_messageController.text.isNotEmpty){
              var message = Message.empty;
              message.senderId = widget.senderId;
              message.receiverId = widget.receiverId;
              message.message = _messageController.text;
              context.read<SendMessageBloc>().add(SendMessage(message: message));

              _messageController.text = '';
            }
          },
          icon: const Icon(
            FontAwesomeIcons.solidPaperPlane,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
