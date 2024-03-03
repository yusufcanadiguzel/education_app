import 'package:equatable/equatable.dart';

abstract class GetPostByCommunityStreamEvent extends Equatable{
  const GetPostByCommunityStreamEvent();

  @override
  List<Object?> get props => [];
}

class GetPostByCommunityStream extends GetPostByCommunityStreamEvent{
  final String communityId;

  const GetPostByCommunityStream({required this.communityId});

  @override
  List<Object?> get props => [communityId];
}