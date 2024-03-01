import 'dart:developer';

import 'package:education_app/blocs/community/get_all_communities_by_name_bloc/get_all_communities_by_name_event.dart';
import 'package:education_app/blocs/community/get_all_communities_by_name_bloc/get_all_communities_by_name_state.dart';
import 'package:education_app/repositories/abstract/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllCommunitiesByNameBloc extends Bloc<GetAllCommunitiesByNameEvent, GetAllCommunitiesByNameState>{
  final CommunityRepository communityRepository;
  GetAllCommunitiesByNameBloc({required CommunityRepository repository}) : communityRepository = repository, super(GetAllCommunitiesByNameStateInitial()){
    on<GetAllCommunitiesByName>(_onGetAllCommunitiesByName);
  }

  Future<void> _onGetAllCommunitiesByName(GetAllCommunitiesByName event, Emitter<GetAllCommunitiesByNameState> emit) async {
    emit(GetAllCommunitiesByNameStateProcess());
    try{
      var communities = await communityRepository.getAllCommunitiesByName(event.name);
      emit(GetAllCommunitiesByNameStateSuccess(communities: communities));
    } catch (exception) {
      log(exception.toString());
      emit(GetAllCommunitiesByNameStateFailure());
    }
  }
}