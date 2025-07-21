import 'package:easydiagno/screens/Login_Signup/LoginScreen.dart';
import 'package:flutter/material.dart';

class Successfullyregistered extends StatefulWidget {
  const Successfullyregistered({super.key});

  @override
  State<Successfullyregistered> createState() => _SuccessfullyregisteredState();
}

class _SuccessfullyregisteredState extends State<Successfullyregistered> {

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Successfully registered your hospital, once admin approved the registration request you will be able to login"),),
    );
  }

  navigate()async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  }
}