
import 'dart:convert';

List<Homepage> homepageFromJson(String str) => List<Homepage>.from(json.decode(str).map((x) => Homepage.fromJson(x)));

String homepageToJson(List<Homepage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Homepage {
    Homepage({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Homepage.fromJson(Map<String, dynamic> json) => Homepage(
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
        required this.dateCreated,
        required this.review,
        required this.username,
    });

    int user;
    DateTime dateCreated;
    String review;
    String username;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        dateCreated: DateTime.parse(json["date_created"]),
        review: json["review"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date_created": "${dateCreated.year.toString().padLeft(4, '0')}-${dateCreated.month.toString().padLeft(2, '0')}-${dateCreated.day.toString().padLeft(2, '0')}",
        "review": review,
        "username": username,
    };
}
