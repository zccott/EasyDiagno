// To parse this JSON data, do
//
//     final HospitalRequestModel = HospitalRequestModelFromJson(jsonString);

import 'dart:convert';

HospitalRequestModel HospitalRequestModelFromJson(String str) =>
    HospitalRequestModel.fromJson(json.decode(str));

String HospitalRequestModelToJson(HospitalRequestModel data) =>
    json.encode(data.toJson());

class HospitalRequestModel {
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
  String type;

  HospitalRequestModel({
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
    required this.type,
  });

  factory HospitalRequestModel.fromJson(Map<String, dynamic> json) =>
      HospitalRequestModel(
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
        type: json["type"],
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
        "type": type,
      };
}
