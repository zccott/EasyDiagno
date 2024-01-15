import 'package:easydiagno/screens/Login_Signup/SplashScreen.dart';
import 'package:flutter/material.dart';

const SAVE_KEY = "userloggedin";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        //darkTheme: ThemeData.dark(),
        //themeMode: ThemeMode.system,
        home: SplashScreen());
  }
}
