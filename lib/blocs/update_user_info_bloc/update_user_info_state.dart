import 'package:equatable/equatable.dart';

abstract class UpdateUserInfoState extends Equatable{
  const UpdateUserInfoState();

  @override
  List<Object?> get props => [];
}

class UpdateUserInfoInitial extends UpdateUserInfoState{}

class UpdateUserInfoProcess extends UpdateUserInfoState{}

class UpdateUserInfoSuccess extends UpdateUserInfoState{}

class UpdateUserInfoFailure extends UpdateUserInfoState{}