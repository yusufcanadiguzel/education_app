import 'dart:developer';

import 'package:education_app/blocs/post/create_post_bloc/create_post_event.dart';
import 'package:education_app/blocs/post/create_post_bloc/create_post_state.dart';
import 'package:education_app/repositories/abstract/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState>{
  final PostRepository postRepository;
  CreatePostBloc({required PostRepository repository}) : postRepository = repository, super(CreatePostInitial()){
    on<CreatePost>(_onCreatePost);
  }

  Future<void> _onCreatePost(CreatePost event, Emitter<CreatePostState> emit) async {
    emit(CreatePostProcess());
    try{
      await postRepository.createPost(event.post);
      emit(CreatePostSuccess());
    } catch (exception) {
      log(exception.toString());
      emit(CreatePostFailure());
    }
  }
}