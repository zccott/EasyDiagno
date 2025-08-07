// To parse this JSON data, do
//
//     final HospitalBaseModel = HospitalBaseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HospitalBaseModel HospitalBaseModelFromJson(String str) =>
    HospitalBaseModel.fromJson(json.decode(str));

String HospitalBaseModelToJson(HospitalBaseModel data) =>
    json.encode(data.toJson());

class HospitalBaseModel {
  String addressLine;
  String city;
  String country;
  String email;
  int hospitalId;
  String hospitalName;
  String img;
  String licenceNumber;
  int loginId;
  int phoneNumber;
  int pincode;
  String state;

  HospitalBaseModel({
    required this.addressLine,
    required this.city,
    required this.country,
    required this.email,
    required this.hospitalId,
    required this.hospitalName,
    required this.img,
    required this.licenceNumber,
    required this.loginId,
    required this.phoneNumber,
    required this.pincode,
    required this.state,
  });

  factory HospitalBaseModel.fromJson(Map<String, dynamic> json) =>
      HospitalBaseModel(
        addressLine: json["address_line"],
        city: json["city"],
        country: json["country"],
        email: json["email"],
        hospitalId: json["hospital_id"],
        hospitalName: json["hospital_name"],
        img: json["img"],
        licenceNumber: json["licence_number"],
        loginId: json["login_id"],
        phoneNumber: json["phone_number"],
        pincode: json["pincode"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "address_line": addressLine,
        "city": city,
        "country": country,
        "email": email,
        "hospital_id": hospitalId,
        "hospital_name": hospitalName,
        "img": img,
        "licence_number": licenceNumber,
        "login_id": loginId,
        "phone_number": phoneNumber,
        "pincode": pincode,
        "state": state,
      };
}
