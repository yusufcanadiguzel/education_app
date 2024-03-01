import 'package:equatable/equatable.dart';

abstract class GetAllPostsEvent extends Equatable{
  const GetAllPostsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllPosts extends GetAllPostsEvent{}