import 'package:equatable/equatable.dart';

abstract class GetUserByIdEvent extends Equatable{
  const GetUserByIdEvent();

  @override
  List<Object?> get props => [];
}

class GetUserById extends GetUserByIdEvent{
  final String id;

  const GetUserById({required this.id});

  @override
  List<Object?> get props => [];
}