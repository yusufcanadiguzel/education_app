import 'dart:developer';

import 'package:education_app/blocs/leave_community_bloc/leave_community_event.dart';
import 'package:education_app/blocs/leave_community_bloc/leave_community_state.dart';
import 'package:education_app/repositories/abstract/community_users.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaveCommunityBloc extends Bloc<LeaveCommunityEvent, LeaveCommunityState>{
  final CommunityUsersRepository communityUsersRepository;
  LeaveCommunityBloc({required CommunityUsersRepository repository}) : communityUsersRepository = repository, super(LeaveCommunityInitial()){
    on<LeaveCommunity>(_onLeaveCommunity);
  }

  void _onLeaveCommunity(LeaveCommunity event, Emitter<LeaveCommunityState> emit){
    emit(LeaveCommunityProcess());
    try{
      communityUsersRepository.leaveCommunity(event.docId);
      emit(LeaveCommunitySuccess());
    } catch (exception) {
      log(exception.toString());
      emit(LeaveCommunityFailure());
    }
  }
}