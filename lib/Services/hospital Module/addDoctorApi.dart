import 'dart:convert';
import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/HospitalModel/getSpecialisation.dart';
import 'package:easydiagno/Models/HospitalModel/hospitalReg1Model.dart';
import 'package:http/http.dart' as http;

Future<bool> addDoctorApi(
    List<Doctors> doctors, List<Specialisation> spec) async {
  try {
    final url = Uri.parse('$baseUrl/doctordetails');
    final response = await http.post(
      url,
      body: {
        // "specialisation": jsonEncode(spec),
        "doctors": jsonEncode(doctors.map((doctor) => doctor.toJson()).toList())
      },
    );
    print('here');
    print(response.body);
    print("Status ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("success added doctor");
      return true;
    } else {
      print("else");
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    print("Catch : ${e.toString()}");
    return false;
  }
}
