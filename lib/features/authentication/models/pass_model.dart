// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);
import 'dart:convert';

PasswordModel passwordModelFromJson(String str) =>
    PasswordModel.fromJson(json.decode(str));

String passwordModelToJson(PasswordModel data) => json.encode(data.toJson());

class PasswordModel {
  int? id;
  String? password;
  String? newpassword;
  String? confirmpassword;

  PasswordModel(
      {this.id, this.password, this.newpassword, this.confirmpassword});

  factory PasswordModel.fromJson(Map<String, dynamic> json) => PasswordModel(
        id: json["id"],
        password: json["password"],
        newpassword: json["newpassword"],
        confirmpassword: json["confirmpassword"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "newpassword": newpassword,
        "confirmpassword": confirmpassword,
      };
}
