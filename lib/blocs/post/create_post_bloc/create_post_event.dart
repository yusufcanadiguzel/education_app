import 'package:education_app/models/post/post.dart';
import 'package:equatable/equatable.dart';

abstract class CreatePostEvent extends Equatable{
  const CreatePostEvent();

  @override
  List<Object?> get props => [];
}

class CreatePost extends CreatePostEvent{
  final Post post;

  const CreatePost({required this.post});
}