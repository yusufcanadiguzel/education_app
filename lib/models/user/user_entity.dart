import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? title;
  final String? profilePictureUrl;
  final String? fullName;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.title,
    this.profilePictureUrl,
    this.fullName,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'title': title,
      'profilePictureUrl': profilePictureUrl,
      'fullName': fullName,
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> document) {
    return UserEntity(
      id: document['id'] as String,
      firstName: document['firstName'] as String,
      lastName: document['lastName'] as String,
      email: document['email'] as String,
      title: document['title'] as String?,
      profilePictureUrl: document['profilePictureUrl'] as String?,
      fullName: document['fullName'] as String?,
    );
  }

  @override
  List<Object?> get props =>
      [id, firstName, lastName, email, title, profilePictureUrl, fullName];
}
