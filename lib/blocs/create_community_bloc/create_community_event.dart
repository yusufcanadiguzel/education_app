import 'package:education_app/models/community/community.dart';
import 'package:equatable/equatable.dart';

abstract class CreateCommunityEvent extends Equatable{
  const CreateCommunityEvent();

  @override
  List<Object?> get props => [];
}

class CreateCommunity extends CreateCommunityEvent{
  final Community community;

  const CreateCommunity({required this.community});

  @override
  List<Object?> get props => [community];
}