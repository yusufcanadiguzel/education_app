import 'dart:developer';
import 'package:education_app/blocs/join_community_bloc/join_community_event.dart';
import 'package:education_app/blocs/join_community_bloc/join_community_state.dart';
import 'package:education_app/repositories/abstract/community_users.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinCommunityBloc extends Bloc<JoinCommunityEvent, JoinCommunityState>{
  final CommunityUsersRepository communityUsersRepository;
  JoinCommunityBloc({required CommunityUsersRepository repository}) : communityUsersRepository = repository, super(JoinCommunityInitial()){
    on<JoinCommunity>(_onJoinCommunity);
  }

  void _onJoinCommunity(JoinCommunity event, Emitter<JoinCommunityState> emit){
    emit(JoinCommunityProcess());
    try{
      communityUsersRepository.joinCommunity(event.communityUser);
      emit(JoinCommunitySuccess());
    } catch (exception) {
      log(exception.toString());
      emit(JoinCommunityFailure());
    }
  }
}