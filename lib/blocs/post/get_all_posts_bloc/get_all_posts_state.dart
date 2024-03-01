import 'package:equatable/equatable.dart';

import '../../../models/post/post.dart';

abstract class GetAllPostsState extends Equatable{
  const GetAllPostsState();

  @override
  List<Object?> get props => [];
}

class GetAllPostsStateInitial extends GetAllPostsState{}

class GetAllPostsStateProcess extends GetAllPostsState{}

class GetAllPostsStateSuccess extends GetAllPostsState{
  final List<Post> posts;

  const GetAllPostsStateSuccess({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class GetAllPostsStateFailure extends GetAllPostsState{}