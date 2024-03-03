import 'package:equatable/equatable.dart';

abstract class JoinCommunityState extends Equatable{
  const JoinCommunityState();

  @override
  List<Object?> get props => [];
}

class JoinCommunityInitial extends JoinCommunityState{}

class JoinCommunityProcess extends JoinCommunityState{}

class JoinCommunitySuccess extends JoinCommunityState{}

class JoinCommunityFailure extends JoinCommunityState{}