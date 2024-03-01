import 'package:equatable/equatable.dart';

abstract class GetAllCommunitiesByNameEvent extends Equatable{
  const GetAllCommunitiesByNameEvent();

  @override
  List<Object?> get props => [];
}

class GetAllCommunitiesByName extends GetAllCommunitiesByNameEvent{
  final String name;

  const GetAllCommunitiesByName({required this.name});

  @override
  List<Object?> get props => [name];
}