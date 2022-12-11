// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

List<Profile> profileFromJson(String str) => List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
  Profile({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.profilePic,
    required this.birthDate,
    required this.gender,
    required this.street,
    required this.city,
    required this.province,
    required this.emergencyFirstname,
    required this.emergencyLastname,
    required this.emergencyRelationship,
    required this.emergencyPhoneNo,
    required this.emergencyStreet,
    required this.emergencyCity,
    required this.emergencyProvince,
    required this.bloodtype,
    required this.bloodpressure,
    required this.illnesses,
    required this.allergies,
  });

  int user;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic phoneNo;
  String profilePic;
  dynamic birthDate;
  dynamic gender;
  dynamic street;
  dynamic city;
  dynamic province;
  dynamic emergencyFirstname;
  dynamic emergencyLastname;
  dynamic emergencyRelationship;
  dynamic emergencyPhoneNo;
  dynamic emergencyStreet;
  dynamic emergencyCity;
  dynamic emergencyProvince;
  dynamic bloodtype;
  dynamic bloodpressure;
  dynamic illnesses;
  dynamic allergies;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNo: json["phone_no"],
    profilePic: json["profile_pic"],
    birthDate: json["birth_date"],
    gender: json["gender"],
    street: json["street"],
    city: json["city"],
    province: json["province"],
    emergencyFirstname: json["emergency_firstname"],
    emergencyLastname: json["emergency_lastname"],
    emergencyRelationship: json["emergency_relationship"],
    emergencyPhoneNo: json["emergency_phone_no"],
    emergencyStreet: json["emergency_street"],
    emergencyCity: json["emergency_city"],
    emergencyProvince: json["emergency_province"],
    bloodtype: json["bloodtype"],
    bloodpressure: json["bloodpressure"],
    illnesses: json["illnesses"],
    allergies: json["allergies"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_no": phoneNo,
    "profile_pic": profilePic,
    "birth_date": birthDate,
    "gender": gender,
    "street": street,
    "city": city,
    "province": province,
    "emergency_firstname": emergencyFirstname,
    "emergency_lastname": emergencyLastname,
    "emergency_relationship": emergencyRelationship,
    "emergency_phone_no": emergencyPhoneNo,
    "emergency_street": emergencyStreet,
    "emergency_city": emergencyCity,
    "emergency_province": emergencyProvince,
    "bloodtype": bloodtype,
    "bloodpressure": bloodpressure,
    "illnesses": illnesses,
    "allergies": allergies,
  };
}
