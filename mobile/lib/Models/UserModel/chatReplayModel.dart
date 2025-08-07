import 'dart:convert';

class Responses{
  String task;

  Responses({
    required this.task,
  });

  factory Responses.fromJson(Map<String, dynamic> json) {
    return Responses(
      task: json['task'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': task,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory Responses.fromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return Responses.fromJson(jsonMap);
  }
}