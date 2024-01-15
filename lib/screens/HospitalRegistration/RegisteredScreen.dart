import 'package:flutter/material.dart';

class RegistrationDoneScreen extends StatelessWidget {
  const RegistrationDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
              "Your registration form has been successfully submitted! Once Admin approved your form you will get a mail with password and user name")),
    );
  }
}
