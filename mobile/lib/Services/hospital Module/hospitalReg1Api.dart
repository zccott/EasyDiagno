import 'dart:convert';
import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/HospitalModel/hospitalReg1Model.dart';
import 'package:http/http.dart' as http;

Future<String> hospitalregistration(HospitalregModel item) async {
  final address = jsonEncode({
    "AddressLine": item.addressLine,
    "PinCode": item.pinCode,
    "Country": "Bharat",
    "City": item.city,
    "State": item.state
  });
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/hospitalregistration'),
    );

    request.fields['HospitalName'] = item.hname;
    request.fields['Email'] = item.email;
    request.fields['LiscenceNumber'] = item.liscenceNum;
    request.fields['Address'] = address;
    request.fields['phone'] = item.phone;
    request.files.add(await http.MultipartFile.fromPath(
      'img',
      item.imagePath.path,
    ));

    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Hospital added successfully');
      return "success";
    } else {
      print('Failed to add menu item: ${response.statusCode}');
      return "failed";
    }
  } catch (e) {
    print('Error adding menu item: $e');
    return "failed";
  }
}
