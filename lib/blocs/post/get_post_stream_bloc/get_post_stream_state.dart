import 'package:equatable/equatable.dart';

import '../../../models/post/post.dart';

abstract class GetPostStreamState extends Equatable{
  const GetPostStreamState();

  @override
  List<Object?> get props => [];
}

class GetPostStreamInitial extends GetPostStreamState{}

class GetPostStreamProcess extends GetPostStreamState{}

class GetPostStreamSuccess extends GetPostStreamState{
  final Stream<List<Post>> postStream;

  const GetPostStreamSuccess({required this.postStream});

  @override
  List<Object?> get props => [postStream];
}

class GetPostStreamFailure extends GetPostStreamState{}