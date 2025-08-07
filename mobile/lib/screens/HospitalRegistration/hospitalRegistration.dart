import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:csc_picker/csc_picker.dart';
import 'package:easydiagno/Constants/constants.dart';
import 'package:easydiagno/Models/HospitalModel/hospitalReg1Model.dart';
import 'package:easydiagno/Services/hospital%20Module/hospitalReg1Api.dart';
import 'package:easydiagno/screens/HospitalRegistration/successfullyRegScreen.dart';
import 'package:easydiagno/screens/Login_Signup/LoginScreen.dart';
import 'package:easydiagno/widgets/Textfields/hosCustomTextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class HospitalRegistration extends StatefulWidget {
  HospitalRegistration({super.key});

  @override
  State<HospitalRegistration> createState() => _HospitalRegistrationState();
}

class _HospitalRegistrationState extends State<HospitalRegistration> {
//Controllers
  final TextEditingController _hospitalnameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  // TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _liscencenumberController =
      TextEditingController();

  final TextEditingController _addressLineController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _pinController = TextEditingController();

  //CssPicker variables
  String city = '';

  String country = '';

  String state = '';

  String selectedFileName = 'No files selected';
  bool isFileSelected = false;
  File? _imagePath;
  final imagePicker = ImagePicker();
  bool isUploading = false;
  ValueNotifier isSel = ValueNotifier(true);
  //String? imagebytes;

  RegistrationCheck() async {
    try {
      final userAuth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: '123456');
      userAuth.user!.sendEmailVerification();
      // await apiRequest();
      //await userAuth.user!.reload();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return buildEmailVerificationDialog();
          });
      //print("successfully registered");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Email already Exists"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 8),
        ));
        print("email already regsitered");
      }
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
//Form Key
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  "Select Image",
                  style: TextStyle(fontSize: 16),
                ),
                h5,
                ValueListenableBuilder(
                  valueListenable: isSel,
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  final result = await imagePicker.pickImage(
                                      source: ImageSource.camera);
                                  if (result != null) {
                                    // Uint8List bytes = await result.readAsBytes();
                                    // //imagebytes = base64Encode(bytes);
                                    setState(() {
                                      selectedFileName = result.name;
                                      isFileSelected = true;
                                      _imagePath = File(result.path);
                                    });
                                  }
                                },
                                icon: Icon(Icons.camera)),
                            //h2,
                            Text("Camera")
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  final result = await imagePicker.pickImage(
                                      source: ImageSource.gallery);
                                  if (result != null) {
                                    setState(() {
                                      selectedFileName = result.name;
                                      isFileSelected = true;
                                      _imagePath = File(result.path);
                                    });
                                  }
                                },
                                icon: Icon(Icons.image)),
                            // h2,
                            Text("Gallery")
                          ],
                        )
                      ],
                    );
                  },
                ),
                h15,

//HospitalName Field
                CustomTextField(
                  inputDecoration: InputDecoration(
                    hintText: "Enter Hospital Name",
                    labelText: 'Hospital Name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                  ),
                  controller: _hospitalnameController,
                  onSaved: (value) {
                    // You can access the input value using _controller1.text
                    print('Input 1: $value');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Hospital name';
                    } else if (value.length < 3) {
                      return 'Must be at least 3 characters long';
                    }
                    return null;
                  },
                ),
                h10,

//Liscencenumber Field
                CustomTextField(
                  inputDecoration: InputDecoration(
                    hintText: "Enter Liscence NUmber",
                    labelText: 'Liscence NUmber',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                  ),
                  controller: _liscencenumberController,
                  onSaved: (value) {
                    // You can access the input value using _controller1.text
                    print('Input 1: $value');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Liscence number';
                    }
                    return null;
                  },
                ),
                h10,

//Email field
                CustomTextField(
                  inputDecoration: InputDecoration(
                    hintText: "Enter Email",
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                  ),
                  controller: _emailController,
                  onSaved: (value) {
                    // You can access the input value using _controller1.text
                    print('Input 1: $value');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),
                h10,
//Phonenumber field
                CustomTextField(
                  inputDecoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                  ),
                  controller: _phoneController,
                  onSaved: (value) {
                    // You can access the input value using _controller1.text
                    print('Input 1: $value');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                h10,

                CustomTextField(
                  inputDecoration: InputDecoration(
                    hintText: "Enter Pin",
                    labelText: 'Pin Code',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                  ),
                  controller: _pinController,
                  onSaved: (value) {
                    // You can access the input value using _controller1.text
                    print('Input 1: $value');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter pin code';
                    }
                    return null;
                  },
                ),
                h10,
//Address section
                CSCPicker(
                  onCountryChanged: (value) {
                    List<String> myValue = value.split(" ");
                    country = myValue[1];
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
                h10,

//StreetAddress field
                CustomTextField(
                  inputDecoration: InputDecoration(
                    hintText: "Enter Street Line",
                    labelText: 'Street Line',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                  ),
                  controller: _addressLineController,
                  onSaved: (value) {
                    // You can access the input value using _controller1.text
                    print('Input 1: $value');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter StreetLine';
                    }
                    return null;
                  },
                ),
                h20,

//Registration Button
                Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                        onPressed: () async {
                          await regClicked(context);
                        },
                        child: Text("Register")))
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Email verification alert
  AlertDialog buildEmailVerificationDialog() {
    return AlertDialog(
      title: Text("Email Verification"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Verification email has been sent. Please check your email and click the 'Verified' button once done.",
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () async {
                  // Wait for the email verification to complete
                  await FirebaseAuth.instance.currentUser!.reload();
                  final user = FirebaseAuth.instance.currentUser;
                  if (user!.emailVerified) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Registered successfully"),
                        backgroundColor: Colors.blue,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 5),
                      ),
                    );

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return Successfullyregistered();
                      }),
                    );
                  } else {
                    // Show a message indicating that the email is not verified
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Email is not verified. Please verify your email before logging in.",
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 8),
                      ),
                    );
                  }
                },
                child: Text("Verified"),
              ),
              TextButton(
                onPressed: () async {
                  // Resend email verification
                  final user = FirebaseAuth.instance.currentUser;
                  await user!.sendEmailVerification();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Verification email resent."),
                      backgroundColor: Colors.blue,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      duration: Duration(seconds: 5),
                    ),
                  );
                },
                child: Text("Resend"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  regClicked(BuildContext context) async {
    print("hi");

    print("Selcted image : $_imagePath");
    print("Selcted image : ${_imagePath!.path}");
    // print("hname : ${_hospitalnameController.text}");
    // print("liscence : ${_liscencenumberController.text}");
    // print("email : ${_emailController.text}");
    // print("addressLine : ${_addressLineController.text}");
    // print("Pin code : ${_pinController.text}");
    // print("country : ");
    // print("State : $state");
    // print("City : $city");
    // print("password : ${_passwordController.text}");

    final hospital = await HospitalregModel(
        imagePath: _imagePath!,
        hname: _hospitalnameController.text,
        liscenceNum: _liscencenumberController.text,
        email: _emailController.text,
        addressLine: _addressLineController.text,
        pinCode: _pinController.text,
        country: "Bharat",
        state: state,
        city: city,
        phone: _phoneController.text);

    // final hos = HospitalregModel(imagePath: imagebytes!, hname: "s", liscenceNum: "s", email: "s", addressLine: "s", pinCode: "s", country: "s", state: "s", city: "s", password: "s");
    String status = await hospitalregistration(hospital);
    print(status);
    // if (status == true) {
    //   RegistrationCheck();
    // }
  }
}
