import 'package:equatable/equatable.dart';

abstract class LeaveCommunityState extends Equatable{
  const LeaveCommunityState();

  @override
  List<Object?> get props => [];
}

class LeaveCommunityInitial extends LeaveCommunityState{}

class LeaveCommunityProcess extends LeaveCommunityState{}

class LeaveCommunitySuccess extends LeaveCommunityState{}

class LeaveCommunityFailure extends LeaveCommunityState{}