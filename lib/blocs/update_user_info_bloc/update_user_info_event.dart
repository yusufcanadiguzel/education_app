import 'package:equatable/equatable.dart';

import '../../models/user/user_model.dart';

abstract class UpdateUserInfoEvent extends Equatable{
  const UpdateUserInfoEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateUserInfo extends UpdateUserInfoEvent{
  final UserModel userModel;

  const UpdateUserInfo({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}