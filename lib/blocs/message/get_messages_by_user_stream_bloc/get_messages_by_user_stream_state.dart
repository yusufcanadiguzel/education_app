import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class GetMessagesByUserStreamState extends Equatable{
  const GetMessagesByUserStreamState();

  @override
  List<Object?> get props => [];
}

class GetMessagesByUserStreamInitial extends GetMessagesByUserStreamState{}

class GetMessagesByUserStreamProcess extends GetMessagesByUserStreamState{}

class GetMessagesByUserStreamSuccess extends GetMessagesByUserStreamState{
  final Stream<QuerySnapshot<Map<String, dynamic>>> messageStream;

  const GetMessagesByUserStreamSuccess({required this.messageStream});
}

class GetMessagesByUserStreamFailure extends GetMessagesByUserStreamState{}