import 'package:equatable/equatable.dart';

class GetUsersEvent extends Equatable{
  const GetUsersEvent();

  @override
  List<Object?> get props => [];
}

class GetUsersByName extends GetUsersEvent{}