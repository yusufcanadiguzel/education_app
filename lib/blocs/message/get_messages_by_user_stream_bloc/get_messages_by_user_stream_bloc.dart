import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/abstract/message_repository.dart';
import 'get_messages_by_user_stream_event.dart';
import 'get_messages_by_user_stream_state.dart';

class GetMessagesByUserStreamBloc extends Bloc<GetMessagesByUserStreamEvent, GetMessagesByUserStreamState>{
  final MessageRepository messageRepository;
  GetMessagesByUserStreamBloc({required MessageRepository repository}) : messageRepository = repository, super(GetMessagesByUserStreamInitial()){
    on<GetMessagesByUserStream>(_onGetMessagesStream);
  }

  Future<void> _onGetMessagesStream(GetMessagesByUserStream event, Emitter<GetMessagesByUserStreamState> emit) async {
    emit(GetMessagesByUserStreamProcess());
    try{
      var messageStream = await messageRepository.getMessagesStreamByUser(event.receiverId);
      emit(GetMessagesByUserStreamSuccess(messageStream: messageStream));
    } catch (exception) {
      log(exception.toString());
      emit(GetMessagesByUserStreamFailure());
    }
  }
}