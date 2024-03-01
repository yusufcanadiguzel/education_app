import 'package:education_app/models/message/message.dart';
import 'package:equatable/equatable.dart';

abstract class GetMessageStreamEvent extends Equatable{
  const GetMessageStreamEvent();

  @override
  List<Object?> get props => [];
}

class GetMessageStream extends GetMessageStreamEvent{}