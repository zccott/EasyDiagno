//Main Hospital reg
import 'dart:io';

class HospitalregModel {
  final File imagePath;
  final String hname;
  final String liscenceNum;
  final String email;
  final String addressLine;
  final String pinCode;
  final String country;
  final String state;
  final String city;
  final String phone;

  HospitalregModel(
      {required this.imagePath,
      required this.hname,
      required this.liscenceNum,
      required this.email,
      required this.addressLine,
      required this.pinCode,
      required this.country,
      required this.state,
      required this.city,
      required this.phone});
}

//add specialization model
class Specialization {
  final String hospitalId;
  final List<String> specialization;

  Specialization({required this.hospitalId, required this.specialization});
}

//add Doctor
class Doctors {
  String id;
  String specialisation;
  String hospitalId;
  String doctorName;
  String qualification;
  List<String> availableDays;

  Doctors({
    this.id = '',
    required this.specialisation,
    required this.hospitalId,
    required this.doctorName,
    required this.qualification,
    required this.availableDays,
  });

  // Convert JSON to Doctors object
  factory Doctors.fromJson(Map<String, dynamic> json) {
    return Doctors(
      id: json['id'] ?? '', // You may need to handle null cases here
      specialisation: json['specialisation'] ?? '',
      hospitalId: json['hospitalId'] ?? '',
      doctorName: json['doctorName'] ?? '',
      qualification: json['qualification'] ?? '',
      availableDays: json['availableDays'] != null
          ? List<String>.from(json['availableDays'])
          : [],
    );
  }

  // Convert Doctors object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialisation': specialisation,
      'hospitalId': hospitalId,
      'doctorName': doctorName,
      'qualification': qualification,
      'availableDays': availableDays,
    };
  }
}
