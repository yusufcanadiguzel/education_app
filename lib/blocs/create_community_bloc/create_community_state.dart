import 'package:equatable/equatable.dart';

abstract class CreateCommunityState extends Equatable{
  const CreateCommunityState();

  @override
  List<Object?> get props => [];
}

class CreateCommunityInitial extends CreateCommunityState{}

class CreateCommunityProcess extends CreateCommunityState{}

class CreateCommunitySuccess extends CreateCommunityState{}

class CreateCommunityFailure extends CreateCommunityState{}