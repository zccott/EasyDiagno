import 'dart:convert';

import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/AdminModel/hospitalReqModel.dart';
import 'package:easydiagno/Models/HospitalModel/hospitalBaseModel.dart';
import 'package:http/http.dart' as http;

Future<bool> hospitaldelete(int hid) async {
  print("here");
  try {
    final response =
        await http.get(Uri.parse('$baseUrl/hospitaldelete?h_id=$hid'));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // final _body = jsonDecode(response.body);
      // final resp =
      //     (_body as List).map((e) => HospitalRequestModel.fromJson(e)).toList();
      return true;
    } else {
      print("else");
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    print("exception:  $e");
    return false;
  }
}
