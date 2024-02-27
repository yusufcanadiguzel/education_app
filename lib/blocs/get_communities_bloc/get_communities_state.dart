import 'package:equatable/equatable.dart';

import '../../models/community/community.dart';

abstract class GetCommunitiesState extends Equatable{
  const GetCommunitiesState();

  @override
  List<Object?> get props => [];
}

class GetCommunitiesInitial extends GetCommunitiesState{}

class GetCommunitiesProcess extends GetCommunitiesState{}

class GetCommunitiesSuccess extends GetCommunitiesState{
  final List<Community> communities;

  const GetCommunitiesSuccess({required this.communities});
}

class GetCommunitiesFailure extends GetCommunitiesState{}