import 'package:education_app/models/user/user_entity.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  String id;
  String firstName;
  String lastName;
  String email;
  String? title;
  String? profilePictureUrl;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.title,
    this.profilePictureUrl,
  });

  static final empty = UserModel(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      title: '',
      profilePictureUrl: '');

  UserModel copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? email,
      String? title,
      String? profilePictureUrl}) {
    return UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        title: title ?? this.title,
        profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl);
  }

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      title: title,
      profilePictureUrl: profilePictureUrl,
    );
  }

  static UserModel fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      email: userEntity.email,
      title: userEntity.title,
      profilePictureUrl: userEntity.profilePictureUrl,
    );
  }

  @override
  String toString() {
    return ''' UserModel : {
      id: $id,
      firstName: $firstName,
      lastName: $lastName,
      email: $email,
      title: $title,
      profilePictureUrl: $profilePictureUrl
    }''';
  }

  @override
  List<Object?> get props => [id, firstName, lastName, email, title, profilePictureUrl];
}
