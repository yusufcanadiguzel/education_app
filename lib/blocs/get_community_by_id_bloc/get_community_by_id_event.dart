import 'package:equatable/equatable.dart';

abstract class GetCommunityByIdEvent extends Equatable{
  const GetCommunityByIdEvent();

  @override
  List<Object?> get props => [];
}

class GetCommunityById extends GetCommunityByIdEvent{
  final String id;

  const GetCommunityById({required this.id});

  @override
  List<Object?> get props => [];
}