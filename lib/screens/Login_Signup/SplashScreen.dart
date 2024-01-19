import 'package:easydiagno/main.dart';
import 'package:easydiagno/screens/AppHome/Homescreen.dart';
import 'package:easydiagno/screens/Login_Signup/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    CheckUserLoggedIn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(child: Image.asset('assets/images/loading1.gif')),
        ),
      ),
    );
  }

  Future<void> gotoWelcome(context) async {
    await Future.delayed(Duration(seconds: 8));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return WelcomeScreen();
    }));
  }

  Future<void> CheckUserLoggedIn(BuildContext context) async {
    await gotoWelcome(context);
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userloggedin = _sharedprefs.getBool(SAVE_KEY);
    if (_userloggedin == null || _userloggedin == false) {
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return HomeScreen();
      }));
    }
  }
}
