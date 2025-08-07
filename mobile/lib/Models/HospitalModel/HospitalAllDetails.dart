// To parse this JSON data, do
//
//     final HospitalAllDetailsModel = HospitalAllDetailsModelFromJson(jsonString);

import 'dart:convert';

HospitalAllDetailsModel HospitalAllDetailsModelFromJson(String str) =>
    HospitalAllDetailsModel.fromJson(json.decode(str));

String HospitalAllDetailsModelToJson(HospitalAllDetailsModel data) =>
    json.encode(data.toJson());

class HospitalAllDetailsModel {
  String addressLine;
  String availableDays;
  String city;
  String country;
  int dId;
  String description;
  String doctorId;
  String email;
  int hospitalId;
  String hospitalName;
  String img;
  String licenceNumber;
  int loginId;
  int phoneNumber;
  int pincode;
  String qualification;
  String specialisation;
  int specialisationId;
  String state;

  HospitalAllDetailsModel({
    required this.addressLine,
    required this.availableDays,
    required this.city,
    required this.country,
    required this.dId,
    required this.description,
    required this.doctorId,
    required this.email,
    required this.hospitalId,
    required this.hospitalName,
    required this.img,
    required this.licenceNumber,
    required this.loginId,
    required this.phoneNumber,
    required this.pincode,
    required this.qualification,
    required this.specialisation,
    required this.specialisationId,
    required this.state,
  });

  factory HospitalAllDetailsModel.fromJson(Map<String, dynamic> json) =>
      HospitalAllDetailsModel(
        addressLine: json["address_line"],
        availableDays: json["available_days"],
        city: json["city"],
        country: json["country"],
        dId: json["d_id"],
        description: json["description"],
        doctorId: json["doctor_id"],
        email: json["email"],
        hospitalId: json["hospital_id"],
        hospitalName: json["hospital_name"],
        img: json["img"],
        licenceNumber: json["licence_number"],
        loginId: json["login_id"],
        phoneNumber: json["phone_number"],
        pincode: json["pincode"],
        qualification: json["qualification"],
        specialisation: json["specialisation"],
        specialisationId: json["specialisation_id"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "address_line": addressLine,
        "available_days": availableDays,
        "city": city,
        "country": country,
        "d_id": dId,
        "description": description,
        "doctor_id": doctorId,
        "email": email,
        "hospital_id": hospitalId,
        "hospital_name": hospitalName,
        "img": img,
        "licence_number": licenceNumber,
        "login_id": loginId,
        "phone_number": phoneNumber,
        "pincode": pincode,
        "qualification": qualification,
        "specialisation": specialisation,
        "specialisation_id": specialisationId,
        "state": state,
      };
}
