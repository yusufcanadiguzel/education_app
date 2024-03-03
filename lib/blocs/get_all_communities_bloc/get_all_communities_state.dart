import 'package:equatable/equatable.dart';

import '../../models/community/community.dart';

abstract class GetAllCommunitiesState extends Equatable{
  const GetAllCommunitiesState();

  @override
  List<Object?> get props => [];
}

class GetAllCommunitiesInitial extends GetAllCommunitiesState{}

class GetAllCommunitiesProcess extends GetAllCommunitiesState{}

class GetAllCommunitiesSuccess extends GetAllCommunitiesState{
  final List<Community> communities;

  const GetAllCommunitiesSuccess({required this.communities});

  @override
  List<Object?> get props => [communities];
}

class GetAllCommunitiesFailure extends GetAllCommunitiesState{}