import 'package:education_app/models/community/community.dart';
import 'package:equatable/equatable.dart';

abstract class GetCommunityEvent extends Equatable{
  const GetCommunityEvent();

  @override
  List<Object?> get props => [];
}

class GetCommunity extends GetCommunityEvent{
  final String communityId;

  const GetCommunity({required this.communityId});

  @override
  List<Object?> get props => [communityId];
}