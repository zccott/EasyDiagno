import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/UserModel/userRegistration.dart';
import 'package:http/http.dart' as http;

Future<bool> userRegistrationApi(UserRegistrationModel userReg) async {
  
  try {
    final response =  await http.get(Uri.parse(
      '$baseUrl/user?email=${userReg.email}&password=${userReg.password}&name=${userReg.name}'));

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
