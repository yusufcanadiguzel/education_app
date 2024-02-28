import 'package:equatable/equatable.dart';

abstract class GetUserEvent extends Equatable{
  const GetUserEvent();

  @override
  List<Object?> get props => [];
}

class GetUser extends GetUserEvent{
  final String userId;

  const GetUser({required this.userId});

  @override
  List<Object?> get props => [userId];
}