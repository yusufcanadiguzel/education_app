import 'package:equatable/equatable.dart';

abstract class GetPostStreamEvent extends Equatable{
  const GetPostStreamEvent();

  @override
  List<Object?> get props => [];
}

class GetPostStream extends GetPostStreamEvent{}