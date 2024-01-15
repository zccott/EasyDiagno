import 'package:csc_picker/csc_picker.dart';
import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Constants/constants.dart';
import 'package:easydiagno/Models/regscreen1/basicdetailsModel.dart';
import 'package:easydiagno/screens/HospitalRegistration/Registration2/registratinScreen2.dart';
import 'package:flutter/material.dart';

class HospitalRegistration extends StatefulWidget {
  HospitalRegistration({super.key});

  @override
  State<HospitalRegistration> createState() => _HospitalRegistrationState();
}

class _HospitalRegistrationState extends State<HospitalRegistration> {
  final hospitalNameController = TextEditingController();
  final liscenceController = TextEditingController();
  final emailController = TextEditingController();
  final addressline1Controller = TextEditingController();
  final zipCodeController = TextEditingController();

  String country = '';
  String state = '';
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Register the Hospital',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h10,
              //Hospital name
              TextFormField(
                cursorColor: Colors.black,
                controller: hospitalNameController,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: float),
                    labelText: 'Hospital',
                    hintText: 'Enter hospital name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: border2))),
              ),
              h15,
              //Email
              TextFormField(
                cursorColor: Colors.black,
                controller: emailController,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: float),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: border2))),
              ),
              h15,
              //License Number
              TextFormField(
                cursorColor: Colors.black,
                controller: liscenceController,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: float),
                    labelText: 'Licence Number',
                    hintText: 'Enter the licence number',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: border2))),
              ),
              h15,
              Text("Address"),
              h10,

              //registration
              TextFormField(
                cursorColor: Colors.black,
                controller: addressline1Controller,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: float),
                    labelText: 'Address Line 1',
                    hintText: 'street,road,',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: border2))),
              ),
              h15,
              TextFormField(
                cursorColor: Colors.black,
                controller: zipCodeController,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: float),
                    labelText: 'Zip',
                    hintText: 'Zip Code',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: border2))),
              ),
              h15,
              CSCPicker(
                onCountryChanged: (value) {
                  country = value;
                  print(country);
                },
                onStateChanged: (value) {
                  if (value != null) {
                    state = value;
                    print(state);
                  } else {
                    return;
                  }
                },
                onCityChanged: (value) {
                  if (value != null) {
                    city = value;
                  } else {
                    return;
                  }
                },
              ),
              h20,
              Center(
                  child: TextButton.icon(
                      onPressed: () {
                        NextButtonClicked();
                      },
                      label: Text(
                        'Next',
                        style: TextStyle(color: textsub, fontSize: 17),
                      ),
                      icon: Icon(
                        Icons.navigate_next,
                        size: 25,
                        color: textsub,
                      )))
            ],
          ),
        ),
      ),
    );
  }

  NextButtonClicked() async {
    final basicInfo = await Basicinfo(
        HospitalName: hospitalNameController.text,
        email: emailController.text,
        liscenceNumber: liscenceController.text);
    final adress = await Address(city,
        addressLine1: addressline1Controller.text,
        zip: zipCodeController.text,
        country: country,
        state: state);
    final regDetails1 = await Reg1Data(binfo: basicInfo, hAddress: adress);
    print(regDetails1.binfo);
    print(regDetails1.hAddress);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => RegScreen2(
              reg1data: regDetails1,
            )));
  }
}





  // TextEditingController zipCodeController = TextEditingController();

  // Future<void> _getAddressDetails(String zip) async {
  //   //String zipCode = zipCodeController.text;
  //   List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
  //   print(placemarks);
  //   // try {
  //   //   List<Location> locations = await locationFromAddress(zip);

  //   //   if (locations.isNotEmpty) {
  //   //     Location location = locations.first;
  //   //     double latitude = location.latitude!;
  //   //     double longitude = location.longitude!;

  //   //     List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

  //   //     for (var placemark in placemarks) {
  //   //       print("Country: ${placemark.country}");
  //   //       print("Administrative Area: ${placemark.administrativeArea}");
  //   //       print("Locality: ${placemark.locality}");
  //   //       print("Sub Locality: ${placemark.subLocality}");
  //   //       print("Thoroughfare: ${placemark.thoroughfare}");
  //   //       print("Sub Thoroughfare: ${placemark.subThoroughfare}");
  //   //       print("Postal Code: ${placemark.postalCode}");
  //   //       print("Coordinates: $latitude, $longitude");
  //   //     }
  //   //   }
  //   // } catch (e) {
  //   //   print("Error: $e");
  //   // }
  // }

