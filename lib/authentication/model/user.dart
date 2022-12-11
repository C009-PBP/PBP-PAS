// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

LoggedInUser userFromJson(String str) => LoggedInUser.fromJson(json.decode(str));

String userToJson(LoggedInUser data) => json.encode(data.toJson());

class LoggedInUser {
  LoggedInUser(
      {required this.username,
      required this.role,
      required this.pk,
      // required this.user
      
      });

  String username;
  String role;
  int pk;
  // String user;

  factory LoggedInUser.fromJson(Map<String, dynamic> json) => LoggedInUser(
        username: json["username"],
        role: json["role"],
        pk: json["pk"],
        // user: json["user"]
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "role": role,
        "pk": pk,
        // "user": user
      };
}
