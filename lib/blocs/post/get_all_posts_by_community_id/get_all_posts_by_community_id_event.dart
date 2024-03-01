import 'package:equatable/equatable.dart';

abstract class GetAllPostsByCommunityIdEvent extends Equatable{
  const GetAllPostsByCommunityIdEvent();

  @override
  List<Object?> get props => [];
}

class GetAllPostsByCommunityId extends GetAllPostsByCommunityIdEvent{
  final String communityId;

  const GetAllPostsByCommunityId({required this.communityId});

  @override
  List<Object?> get props => [communityId];
}