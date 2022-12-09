// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.username,
    required this.role,
    required this.pk,
  });

  String username;
  String role;
  int pk;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        role: json["role"],
        pk: json["pk"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "role": role,
        "pk": pk,
      };
}
