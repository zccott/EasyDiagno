// To parse this JSON data, do
//
//     final LoginResponce = LoginResponce(jsonString);

import 'dart:convert';

LoginResponce LoginResponceFromJson(String str) =>
    LoginResponce.fromJson(json.decode(str));

String LoginResponceToJson(LoginResponce data) => json.encode(data.toJson());

class LoginResponce {
  int lid;
  String task;
  String type;

  LoginResponce({
    required this.lid,
    required this.task,
    required this.type,
  });

  factory LoginResponce.fromJson(Map<String, dynamic> json) => LoginResponce(
        lid: json["lid"],
        task: json["task"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "lid": lid,
        "task": task,
        "type": type,
      };
}
