import 'package:equatable/equatable.dart';

abstract class GetMessagesByUserStreamEvent extends Equatable{
  const GetMessagesByUserStreamEvent();

  @override
  List<Object?> get props => [];
}

class GetMessagesByUserStream extends GetMessagesByUserStreamEvent{
  final String receiverId;

  const GetMessagesByUserStream({required this.receiverId});

  @override
  List<Object?> get props => [receiverId];
}