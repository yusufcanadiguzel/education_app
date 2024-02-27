import 'dart:developer';

import 'package:education_app/blocs/get_communities_bloc/get_communities_event.dart';
import 'package:education_app/blocs/get_communities_bloc/get_communities_state.dart';
import 'package:education_app/repositories/abstract/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCommunitiesBloc extends Bloc<GetCommunitiesEvent, GetCommunitiesState>{
  final CommunityRepository communityRepository;
  GetCommunitiesBloc({required CommunityRepository repository}) : communityRepository = repository,  super(GetCommunitiesInitial()){
    on<GetAllCommunitiesByName>(_onGetAllCommunitiesByName);
  }

  Future<void> _onGetAllCommunitiesByName(GetAllCommunitiesByName event, Emitter<GetCommunitiesState> emit) async {
    emit(GetCommunitiesProcess());
    try{
      var communities = await communityRepository.getAllCommunitiesByName();
      emit(GetCommunitiesSuccess(communities: communities));
    } catch (exception) {
      log(exception.toString());
      emit(GetCommunitiesFailure());
    }
  }
}