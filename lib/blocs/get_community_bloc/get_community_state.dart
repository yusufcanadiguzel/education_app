import 'package:education_app/models/community/community.dart';
import 'package:equatable/equatable.dart';

abstract class GetCommunityState extends Equatable{
  const GetCommunityState();

  @override
  List<Object?> get props => [];
}

class GetCommunityInitial extends GetCommunityState{}

class GetCommunityProcess extends GetCommunityState{}

class GetCommunitySuccess extends GetCommunityState{
  final Community community;

  const GetCommunitySuccess({required this.community});

  @override
  List<Object?> get props => [community];
}

class GetCommunityFailure extends GetCommunityState{}