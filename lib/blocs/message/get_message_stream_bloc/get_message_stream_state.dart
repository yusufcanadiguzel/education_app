import 'package:education_app/models/message/message.dart';
import 'package:equatable/equatable.dart';

abstract class GetMessageStreamState extends Equatable{
  const GetMessageStreamState();

  @override
  List<Object?> get props => [];
}

class GetMessageStreamStateInitial extends GetMessageStreamState{}

class GetMessageStreamStateProcess extends GetMessageStreamState{}

class GetMessageStreamStateSuccess extends GetMessageStreamState{
  final Stream<List<Message>> messageStream;

  const GetMessageStreamStateSuccess({required this.messageStream});

  @override
  List<Object?> get props => [];
}

class GetMessageStreamStateFailure extends GetMessageStreamState{}