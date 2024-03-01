import 'dart:developer';

import 'package:education_app/blocs/post/get_all_posts_bloc/get_all_posts_event.dart';
import 'package:education_app/blocs/post/get_all_posts_bloc/get_all_posts_state.dart';
import 'package:education_app/repositories/abstract/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllPostsBloc extends Bloc<GetAllPostsEvent, GetAllPostsState>{
  final PostRepository postRepository;
  GetAllPostsBloc({required PostRepository repository}) : postRepository = repository, super(GetAllPostsStateInitial()){
    on<GetAllPosts>(_onGetAllPosts);
  }

  Future<void> _onGetAllPosts(GetAllPosts event, Emitter<GetAllPostsState> emit) async {
    emit(GetAllPostsStateProcess());
    try{
      var posts = await postRepository.getAllPosts();
      emit(GetAllPostsStateSuccess(posts: posts));
    } catch (exception) {
      log(exception.toString());
      emit(GetAllPostsStateFailure());
    }
  }
}