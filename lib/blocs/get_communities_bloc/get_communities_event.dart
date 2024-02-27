import 'package:equatable/equatable.dart';

import '../../models/community/community.dart';

abstract class GetCommunitiesEvent extends Equatable{
  const GetCommunitiesEvent();

  @override
  List<Object?> get props => [];
}

class GetAllCommunitiesByName extends GetCommunitiesEvent{}