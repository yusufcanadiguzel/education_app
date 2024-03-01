import 'package:equatable/equatable.dart';

abstract class GetMessageStreamEvent extends Equatable{
  const GetMessageStreamEvent();

  @override
  List<Object?> get props => [];
}

class GetMessageStream extends GetMessageStreamEvent{}