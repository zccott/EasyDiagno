import 'dart:async';
import 'package:easydiagno/screens/HospitalRegistration/SelectDepartment.dart';
import 'package:flutter/material.dart';

bool isRegistrationCompleted = false;

class HospitalHome extends StatefulWidget {
  const HospitalHome({Key? key}) : super(key: key);

  @override
  _HospitalHomeState createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {
  late Timer _timer;
  bool _showPopup = false;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    _timer = Timer(Duration(seconds: 5), () {
      if (!isRegistrationCompleted) {
        setState(() {
          _showPopup = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hospital Home"),
            if (_showPopup) ...[
              // Show the popup if registration is not completed and 20 seconds have passed
              AlertDialog(
                title: Text("Registration Reminder"),
                content: Text(
                    "Your registration is not completed yet. Please complete your profile add Specialisation and Doctors then only users can see your hospital"),
                actions: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _showPopup = false;
                          });

                          // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CheckBoxWidget3()));
                        },
                        child: Text("Close"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _showPopup = false;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => CheckBoxWidget3()));
                        },
                        child: Text("Complete Profile"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
