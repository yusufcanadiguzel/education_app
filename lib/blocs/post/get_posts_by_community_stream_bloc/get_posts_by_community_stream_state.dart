import 'package:education_app/models/post/post.dart';
import 'package:equatable/equatable.dart';

abstract class GetPostsByCommunityStreamState extends Equatable{
  const GetPostsByCommunityStreamState();

  @override
  List<Object?> get props => [];
}

class GetPostsByCommunityStreamInitial extends GetPostsByCommunityStreamState{}

class GetPostsByCommunityStreamProcess extends GetPostsByCommunityStreamState{}

class GetPostsByCommunityStreamSuccess extends GetPostsByCommunityStreamState{
  final Stream<List<Post>> postStream;

  const GetPostsByCommunityStreamSuccess({required this.postStream});
}

class GetPostsByCommunityStreamFailure extends GetPostsByCommunityStreamState{}