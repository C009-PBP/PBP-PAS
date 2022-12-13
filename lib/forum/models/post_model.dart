// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

List<Questions> questionsFromJson(String str) => List<Questions>.from(json.decode(str).map((x) => Questions.fromJson(x)));

String questionsToJson(List<Questions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Questions {
    Questions({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.title,
        required this.detail,
        required this.tags,
        required this.addTime,
    });

    int user;
    String title;
    String detail;
    String tags;
    DateTime addTime;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        detail: json["detail"],
        tags: json["tags"],
        addTime: DateTime.parse(json["add_time"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "detail": detail,
        "tags": tags,
        "add_time": addTime.toIso8601String(),
    };
}
