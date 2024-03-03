import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/abstract/post_repository.dart';
import 'get_posts_by_community_stream_event.dart';
import 'get_posts_by_community_stream_state.dart';

class GetPostsByCommunityStreamBloc extends Bloc<GetPostByCommunityStreamEvent,
    GetPostsByCommunityStreamState> {
  final PostRepository postRepository;

  GetPostsByCommunityStreamBloc({required PostRepository repository})
      : postRepository = repository,
        super(GetPostsByCommunityStreamInitial()) {
    on<GetPostByCommunityStream>(_onGetPostByCommunityStream);
  }

  Future<void> _onGetPostByCommunityStream(GetPostByCommunityStream event,
      Emitter<GetPostsByCommunityStreamState> emit) async {
    emit(GetPostsByCommunityStreamProcess());
    try {
      var postStream =
          await postRepository.getPostStreamByCommunity(event.communityId);
      emit(GetPostsByCommunityStreamSuccess(postStream: postStream));
    } catch (exception) {
      log(exception.toString());
      emit(GetPostsByCommunityStreamFailure());
    }
  }
}
