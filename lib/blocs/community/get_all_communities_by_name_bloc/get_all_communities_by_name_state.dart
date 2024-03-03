import 'package:education_app/models/community/community.dart';
import 'package:equatable/equatable.dart';

abstract class GetAllCommunitiesByNameState extends Equatable{
  const GetAllCommunitiesByNameState();

  @override
  List<Object?> get props => [];
}

class GetAllCommunitiesByNameStateInitial extends GetAllCommunitiesByNameState{}

class GetAllCommunitiesByNameStateProcess extends GetAllCommunitiesByNameState{}

class GetAllCommunitiesByNameStateSuccess extends GetAllCommunitiesByNameState{
  final List<Community> communities;

  const GetAllCommunitiesByNameStateSuccess({required this.communities});

  @override
  List<Object?> get props => [communities];
}

class GetAllCommunitiesByNameStateFailure extends GetAllCommunitiesByNameState{}