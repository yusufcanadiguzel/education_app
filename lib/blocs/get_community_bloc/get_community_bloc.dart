import 'dart:developer';

import 'package:education_app/blocs/get_community_bloc/get_community_event.dart';
import 'package:education_app/blocs/get_community_bloc/get_community_state.dart';
import 'package:education_app/repositories/abstract/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCommunityBloc extends Bloc<GetCommunityEvent, GetCommunityState>{
  final CommunityRepository communityRepository;
  GetCommunityBloc({required CommunityRepository repository}) : communityRepository = repository, super(GetCommunityInitial()){
    on<GetCommunity>(_onGetCommunity);
  }

  Future<void> _onGetCommunity(GetCommunity event, Emitter<GetCommunityState> emit) async {
    emit(GetCommunityProcess());
    try{
      var community = await communityRepository.getCommunityById(event.communityId);
      emit(GetCommunitySuccess(community: community));
    } catch (exception) {
      log(exception.toString());
      emit(GetCommunityFailure());
    }
  }
}