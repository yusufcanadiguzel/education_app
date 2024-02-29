
import 'dart:io';

import 'package:education_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUserById extends UserEvent{
  final String id;

  const GetUserById({required this.id});

  @override
  List<Object?> get props => [id];
}