import 'package:education_app/models/communityUser/communityUser.dart';
import 'package:equatable/equatable.dart';

abstract class JoinCommunityEvent extends Equatable{
  const JoinCommunityEvent();

  @override
  List<Object?> get props => [];
}

class JoinCommunity extends JoinCommunityEvent{
  final CommunityUser communityUser;

  const JoinCommunity({required this.communityUser});

  @override
  List<Object?> get props => [];
}