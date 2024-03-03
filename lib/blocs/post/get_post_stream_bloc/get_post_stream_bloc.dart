import 'dart:developer';

import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_event.dart';
import 'package:education_app/blocs/post/get_post_stream_bloc/get_post_stream_state.dart';
import 'package:education_app/repositories/abstract/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPostStreamBloc extends Bloc<GetPostStreamEvent, GetPostStreamState>{
  final PostRepository postRepository;
  GetPostStreamBloc({required PostRepository repository}) : postRepository = repository, super(GetPostStreamInitial()){
    on<GetPostStream>(_onGetPostStream);
  }

  Future<void> _onGetPostStream(GetPostStream event, Emitter<GetPostStreamState> emit) async {
    emit(GetPostStreamProcess());
    try{
      var postStream = await postRepository.getPostStream();
      emit(GetPostStreamSuccess(postStream: postStream));
    } catch (exception) {
      log(exception.toString());
      emit(GetPostStreamFailure());
    }
  }
}