import 'package:equatable/equatable.dart';

abstract class LeaveCommunityEvent extends Equatable{
  const LeaveCommunityEvent();

  @override
  List<Object?> get props => [];
}

class LeaveCommunity extends LeaveCommunityEvent{
  final String docId;

  const LeaveCommunity({required this.docId});

  @override
  List<Object?> get props => [docId];
}