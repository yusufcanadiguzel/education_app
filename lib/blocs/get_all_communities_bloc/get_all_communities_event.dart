import 'package:equatable/equatable.dart';

abstract class GetAllCommunitiesEvent extends Equatable{
  const GetAllCommunitiesEvent();

  @override
  List<Object?> get props => [];
}

class GetAllCommunities extends GetAllCommunitiesEvent{}