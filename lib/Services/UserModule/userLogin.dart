import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/UserModel/userLogin.dart';
import 'package:http/http.dart' as http;

Future<bool> userLoginApi(UserLoginmodel userlogin) async {
  
  try {
    final response =  await http.get(Uri.parse(
      '$baseUrl/user?email=${userlogin.email}&password=${userlogin.password}'));
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return true;
      }
      else{
        return false;
      }
  } catch (e) {
    return false; 
  }
}
