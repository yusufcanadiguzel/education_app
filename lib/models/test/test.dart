import 'dart:convert';

class Test {
  final String id;
  final String name;
  final String description;

  Test({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
