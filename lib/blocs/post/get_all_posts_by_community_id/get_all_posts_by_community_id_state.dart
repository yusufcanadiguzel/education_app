import 'package:education_app/models/post/post.dart';
import 'package:equatable/equatable.dart';

abstract class GetAllPostsByCommunityIdState extends Equatable{
  const GetAllPostsByCommunityIdState();

  @override
  List<Object?> get props => [];
}

class GetAllPostsByCommunityIdInitial extends GetAllPostsByCommunityIdState{}

class GetAllPostsByCommunityIdProcess extends GetAllPostsByCommunityIdState{}

class GetAllPostsByCommunityIdSuccess extends GetAllPostsByCommunityIdState{
  final List<Post> posts;

  const GetAllPostsByCommunityIdSuccess({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class GetAllPostsByCommunityIdFailure extends GetAllPostsByCommunityIdState{}