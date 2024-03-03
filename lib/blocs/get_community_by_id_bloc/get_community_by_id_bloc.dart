import 'dart:developer';
import 'package:education_app/blocs/get_community_by_id_bloc/get_community_by_id_state.dart';
import 'package:education_app/repositories/abstract/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_community_by_id_event.dart';

class GetCommunityByIdBloc extends Bloc<GetCommunityByIdEvent, GetCommunityByIdState>{
  final CommunityRepository communityRepository;
  GetCommunityByIdBloc({required CommunityRepository repository}) : communityRepository = repository, super(GetCommunityByIdInitial()){
    on<GetCommunityById>(_onGetCommunityById);
  }

  Future<void> _onGetCommunityById(GetCommunityById event, Emitter<GetCommunityByIdState> emit) async {
    try{
      var community = await communityRepository.getCommunityById(event.id);
      emit(GetCommunityByIdSuccess(community: community));
    } catch (exception) {
      log(exception.toString());
      emit(GetCommunityByIdFailure());
    }
  }
}