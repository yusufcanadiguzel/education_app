import 'package:education_app/models/user/user_entity.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? title;
  final String? profilePictureUrl;
  final String? fullName;
  final String? aboutMe;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.title,
    this.profilePictureUrl,
    this.fullName,
    this.aboutMe,
  });

  static const empty = UserModel(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    title: '',
    profilePictureUrl: '',
    fullName: '',
    aboutMe: '',
  );

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? title,
    String? profilePictureUrl,
    String? fullName,
    String? aboutMe,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      title: title ?? this.title,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      fullName: fullName ?? this.fullName,
      aboutMe: aboutMe ?? this.aboutMe,
    );
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
      fullName: fullName,
      aboutMe: aboutMe,
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
      fullName: userEntity.fullName,
      aboutMe: userEntity.aboutMe,
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
      profilePictureUrl: $profilePictureUrl,
      fullName: $fullName,
      aboutMe: $aboutMe,
    }''';
  }

  @override
  List<Object?> get props =>
      [id, firstName, lastName, email, title, profilePictureUrl, fullName, aboutMe,];
}
