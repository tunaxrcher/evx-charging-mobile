// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int? id;
  String? phone;
  String? firstname;
  String? lastname;
  String? email;

  UserModel({
    this.id,
    this.phone,
    this.firstname,
    this.lastname,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        phone: json["phone"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
      };
}
