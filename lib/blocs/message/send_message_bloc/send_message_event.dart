import 'package:education_app/models/message/message.dart';
import 'package:equatable/equatable.dart';

abstract class SendMessageEvent extends Equatable{
  const SendMessageEvent();

  @override
  List<Object?> get props => [];
}

class SendMessage extends SendMessageEvent{
  final Message message;

  const SendMessage({required this.message});

  @override
  List<Object?> get props => [message];
}