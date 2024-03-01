import 'dart:developer';
import 'package:education_app/repositories/abstract/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_all_communities_event.dart';
import 'get_all_communities_state.dart';

class GetAllCommunitiesBloc
    extends Bloc<GetAllCommunitiesEvent, GetAllCommunitiesState> {
  final CommunityRepository communityRepository;

  GetAllCommunitiesBloc({required CommunityRepository repository})
      : communityRepository = repository,
        super(GetAllCommunitiesInitial()) {
    on<GetAllCommunities>(_onGetAllCommunities);
  }

  Future<void> _onGetAllCommunities(GetAllCommunities event, Emitter<GetAllCommunitiesState> emit) async {
    try{
      var communities = await communityRepository.getAllCommunities();
      emit(GetAllCommunitiesSuccess(communities: communities));
    } catch (exception) {
      log(exception.toString());
      emit(GetAllCommunitiesFailure());
    }
  }
}
