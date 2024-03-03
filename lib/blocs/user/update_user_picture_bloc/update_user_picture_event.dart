import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class UpdateUserPictureEvent extends Equatable{
  const UpdateUserPictureEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserPicture extends UpdateUserPictureEvent{
  final String userId;
  final String path;
  final File file;

  const UpdateUserPicture({required this.userId, required this.path, required this.file});

  @override
  List<Object?> get props => [userId, path, file];
}