
import 'dart:convert';
import 'dart:developer';

import 'package:easydiagno/Models/UserModel/chatReplayModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

  Future<Responses?> msges(String msg) async {
    List<Responses> msges = [];
    var client = http.Client();
    print("inside repo");
    try {
      final Response response = await client
           .get(Uri.parse('http://192.168.1.18:5000/insertchatbot?msg=$msg&lid=34'));
      if (response.statusCode == 200 || response.statusCode == 201) {

      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Directly convert the JSON response to the Responses object
      final Responses reply = Responses.fromJson(jsonResponse);
      print(reply.task.toString());

      return reply;

      } else {
        print(response.statusCode);
        print(response.body);
        return null;
        
      }
    } catch (e) {
      log(e.toString());
      print('catch: ${e.toString()}');
      return null;
    }
  }


