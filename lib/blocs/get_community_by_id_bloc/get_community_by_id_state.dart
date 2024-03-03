import 'package:education_app/models/community/community.dart';
import 'package:equatable/equatable.dart';

abstract class GetCommunityByIdState extends Equatable{
  const GetCommunityByIdState();

  @override
  List<Object?> get props => [];
}

class GetCommunityByIdInitial extends GetCommunityByIdState{}

class GetCommunityByIdProcess extends GetCommunityByIdState{}

class GetCommunityByIdSuccess extends GetCommunityByIdState{
  final Community community;

  const GetCommunityByIdSuccess({required this.community});

  @override
  List<Object?> get props => [community];
}

class GetCommunityByIdFailure extends GetCommunityByIdState{}