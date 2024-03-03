import 'dart:developer';

import 'package:education_app/blocs/post/get_all_posts_by_community_id/get_all_posts_by_community_id_event.dart';
import 'package:education_app/blocs/post/get_all_posts_by_community_id/get_all_posts_by_community_id_state.dart';
import 'package:education_app/repositories/abstract/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllPostsByCommunityIdBloc extends Bloc<GetAllPostsByCommunityIdEvent, GetAllPostsByCommunityIdState>{
  final PostRepository postRepository;
  GetAllPostsByCommunityIdBloc({required PostRepository repository}) : postRepository = repository, super(GetAllPostsByCommunityIdInitial()){
    on<GetAllPostsByCommunityId>(_onGetAllPostsByCommunityId);
  }

  Future<void> _onGetAllPostsByCommunityId(GetAllPostsByCommunityId event, Emitter<GetAllPostsByCommunityIdState> emit) async {
    emit(GetAllPostsByCommunityIdProcess());
    try{
       var posts = await postRepository.getPostByCommunityId(event.communityId);
       emit(GetAllPostsByCommunityIdSuccess(posts: posts));
    } catch (exception) {
      log(exception.toString());
      emit(GetAllPostsByCommunityIdFailure());
    }
  }
}