import 'dart:developer';

import 'package:education_app/blocs/message/get_message_stream_bloc/get_message_stream_event.dart';
import 'package:education_app/blocs/message/get_message_stream_bloc/get_message_stream_state.dart';
import 'package:education_app/repositories/abstract/message_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMessageStreamBloc extends Bloc<GetMessageStreamEvent, GetMessageStreamState>{
  final MessageRepository messageRepository;
  GetMessageStreamBloc({required MessageRepository repository}) : messageRepository = repository, super(GetMessageStreamStateInitial()){
    on<GetMessageStream>(_onGetMessageStream);
  }

  Future<void> _onGetMessageStream(GetMessageStream event, Emitter<GetMessageStreamState> emit) async {
    emit(GetMessageStreamStateProcess());
    try{
      var messageStream = await messageRepository.getMessageStream();
      emit(GetMessageStreamStateSuccess(messageStream: messageStream));
    } catch (exception) {
      log(exception.toString());
      emit(GetMessageStreamStateFailure());
    }
  }
}