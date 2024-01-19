
// import 'dart:convert';
// import 'dart:developer';

// import 'package:easydiagno/Models/registrationDB.dart';
// import 'package:http/http.dart' as http;
// registration() async {
//   var client = http.Client();
//   print("inside repo");
  
//   try {
//     final String regJson = json.encode(reg);
//     final response = await client.get(Uri.parse('http://192.168.1.13:5000/reg?AvailableDays=$regJson'));
    
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       // Check the content type of the response
//       if (response.headers['content-type']!.contains('application/json')) {
//         // If the response is JSON, parse it
//         final Map<String, dynamic> data = json.decode(response.body);
//         print('Success: $data');
//       } else {
//         // If the response is not JSON, handle it accordingly
//         print('Success: ${response.body}');
//       }
//     } else {
//       print('Error - Status Code: ${response.statusCode}');
//       print('Error - Response Body: ${response.body}');
//     }
//   } catch (e) {
//     log(e.toString());
//     print('Catch: ${e.toString()}');
//     return null;
//   } finally {
//     client.close();
//   }
// }
