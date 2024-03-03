import 'package:equatable/equatable.dart';

abstract class SendMessageState extends Equatable{
  const SendMessageState();

  @override
  List<Object?> get props => [];
}

class SendMessageInitial extends SendMessageState{}

class SendMessageProcess extends SendMessageState{}

class SendMessageSuccess extends SendMessageState{}

class SendMessageFailure extends SendMessageState{}