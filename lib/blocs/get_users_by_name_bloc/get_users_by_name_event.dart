import 'package:equatable/equatable.dart';

abstract class GetUsersByNameEvent extends Equatable{
  const GetUsersByNameEvent();

  @override
  List<Object?> get props => [];
}

class GetUsersByName extends GetUsersByNameEvent{
  final String name;

  const GetUsersByName({required this.name});

  @override
  List<Object?> get props => [name];
}