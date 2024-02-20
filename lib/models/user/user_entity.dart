import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  String id;
  String firstName;
  String lastName;
  String email;
  String? title;
  String? profilePictureUrl;

  UserEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.title,
      this.profilePictureUrl});

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'title': title,
      'profilePictureUrl': profilePictureUrl
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> document) {
    return UserEntity(
        id: document['id'] as String,
        firstName: document['firstName'] as String,
        lastName: document['lastName'] as String,
        email: document['email'] as String,
        title: document['title'] as String?,
        profilePictureUrl: document['profilePictureUrl'] as String?);
  }

  @override
  List<Object?> get props => [id, firstName, lastName, email, title, profilePictureUrl];
}
