

import 'dart:developer';

import 'package:education_app/blocs/message/send_message_bloc/send_message_event.dart';
import 'package:education_app/blocs/message/send_message_bloc/send_message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/abstract/message_repository.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState>{
  final MessageRepository messageRepository;
  SendMessageBloc({required MessageRepository repository}) : messageRepository = repository, super(SendMessageInitial()){
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<SendMessageState> emit) async {
    emit(SendMessageProcess());
    try{
      await messageRepository.sendMessage(event.message);
      emit(SendMessageSuccess());
    } catch (exception) {
      log(exception.toString());
      emit(SendMessageFailure());
    }
  }
}