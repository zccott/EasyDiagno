import 'dart:convert';
import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/UserModel/loginModel.dart';
import 'package:easydiagno/Models/UserModel/loginResponce.dart';
import 'package:http/http.dart' as http;

Future<void> hospitalByCategory(String category) async {
  try {
    final response = await http.get(
        Uri.parse('$baseUrl/viewhospitalBycategory?specialisation=Cardiology'));

    print("category responce ${response.body}");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // final _body = jsonDecode(response.body);
      // final resp = LoginResponce.fromJson(_body);
      return null;
    } else {
      print("else");
      print(response.statusCode);
      return null;
    }
  } catch (e) {
    return null;
  }
}
