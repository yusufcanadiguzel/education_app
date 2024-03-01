import 'package:equatable/equatable.dart';

abstract class CreatePostState extends Equatable{
  const CreatePostState();

  @override
  List<Object?> get props => [];
}

class CreatePostInitial extends CreatePostState{}

class CreatePostProcess extends CreatePostState{}

class CreatePostSuccess extends CreatePostState{}

class CreatePostFailure extends CreatePostState{}