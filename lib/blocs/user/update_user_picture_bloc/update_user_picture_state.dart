import 'package:equatable/equatable.dart';

abstract class UpdateUserPictureState extends Equatable {
  const UpdateUserPictureState();

  @override
  List<Object?> get props => [];
}

class UpdateUserPictureStateInitial extends UpdateUserPictureState{}

class UpdateUserPictureStateProcess extends UpdateUserPictureState{}

class UpdateUserPictureStateSuccess extends UpdateUserPictureState{}

class UpdateUserPictureStateFailure extends UpdateUserPictureState{}