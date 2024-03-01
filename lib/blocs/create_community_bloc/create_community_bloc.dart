import 'dart:developer';

import 'package:education_app/blocs/create_community_bloc/create_community_event.dart';
import 'package:education_app/blocs/create_community_bloc/create_community_state.dart';
import 'package:education_app/repositories/abstract/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCommunityBloc extends Bloc<CreateCommunityEvent, CreateCommunityState>{
  CommunityRepository communityRepository;
  CreateCommunityBloc({required CommunityRepository repository}) : communityRepository = repository, super(CreateCommunityInitial()){
    on<CreateCommunity>(_onCreateCommunity);
  }

  Future<void> _onCreateCommunity(CreateCommunity event, Emitter<CreateCommunityState> emit) async {
    try{
      await communityRepository.createCommunity(event.community);
      emit(CreateCommunitySuccess());
    } catch (exception) {
      log(exception.toString());
      emit(CreateCommunityFailure());
    }
  }
}