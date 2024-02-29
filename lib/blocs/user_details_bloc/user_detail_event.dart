abstract class UserDetailEvent {}

class GetUserDetail extends UserDetailEvent{
  final String userId;

  GetUserDetail({required this.userId});
}
