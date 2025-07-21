import 'dart:convert';

import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/HospitalModel/hospitalBaseModel.dart';
import 'package:easydiagno/Models/constantShared.dart';
import 'package:http/http.dart' as http;

Future<List<HospitalBaseModel>?> hospitalById() async {
  print("here");
  try {
    final response =
        await http.get(Uri.parse('$baseUrl/viewhospitalbyid?hospital_id=$lid'));
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final _body = jsonDecode(response.body);
      final resp =
          (_body as List).map((e) => HospitalBaseModel.fromJson(e)).toList();
      //final resp = LoginResponce.fromJson(_body);
      return resp;
    } else {
      print("else");
      print(response.statusCode);
      return null;
    }
  } catch (e) {
    print("exception:  $e");
    return null;
  }
}
