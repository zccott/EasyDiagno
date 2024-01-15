import 'package:easydiagno/Models/regscreen1/basicdetailsModel.dart';
import 'package:easydiagno/Models/regscreen2/addDoctorModel.dart';
import 'package:easydiagno/Models/regscreen2/specialisationModel.dart';

class HospitalRegistration {
  final Reg1Data reg1data;
  final Specialization specializations;
  final List<DoctorDetailsSubmit> submittedDoctors;

  HospitalRegistration(
      {required this.reg1data,
      required this.specializations,
      required this.submittedDoctors});
}

Map<String, dynamic> reg = {
  "HospitalName": "abc",
  "Email": "abc@gmail.com",
  "LiscenceNumber": "sd123",
  "Address": {
    "AddressLine": "dffg,hbjk",
    "PinCode": "650032",
    "Country": "Bharath",
    "State": "Kerala",
    "City": "Calicut",
  },
  "Specialization": ["Ortho", "Gastro"],
  "Doctors": [
    {
      "Name": "Sidh",
      "Specialization": "Ortho",
      "Qualification": "MBBS",
      "AvailableDays": ["Monday", "Friday"]
    }
  ]
};
