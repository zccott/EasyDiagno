// To parse this JSON data, do
//
//     final UsersByAdmin = UsersByAdminFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UsersByAdmin UsersByAdminFromJson(String str) =>
    UsersByAdmin.fromJson(json.decode(str));

String UsersByAdminToJson(UsersByAdmin data) => json.encode(data.toJson());

class UsersByAdmin {
  dynamic address;
  String email;
  dynamic gender;
  dynamic height;
  int loginId;
  String name;
  dynamic phoneNumber;
  dynamic pincode;
  int userId;
  dynamic weight;

  UsersByAdmin({
    required this.address,
    required this.email,
    required this.gender,
    required this.height,
    required this.loginId,
    required this.name,
    required this.phoneNumber,
    required this.pincode,
    required this.userId,
    required this.weight,
  });

  factory UsersByAdmin.fromJson(Map<String, dynamic> json) => UsersByAdmin(
        address: json["address"],
        email: json["email"],
        gender: json["gender"],
        height: json["height"],
        loginId: json["login_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        pincode: json["pincode"],
        userId: json["user_id"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "gender": gender,
        "height": height,
        "login_id": loginId,
        "name": name,
        "phone_number": phoneNumber,
        "pincode": pincode,
        "user_id": userId,
        "weight": weight,
      };
}
