import 'package:easydiagno/screens/AppHome/Homescreen.dart';
import 'package:easydiagno/screens/AppHome/ProfileScreen.dart';
import 'package:easydiagno/screens/HospitalRegistration/hospitalHome.dart';
import 'package:easydiagno/screens/Login_Signup/SplashScreen.dart';
import 'package:easydiagno/screens/Login_Signup/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// const SAVE_KEY = "userloggedin";
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBVBdpK-LsPKpQ2sY5oXL4wrm5H7b5I7O0',
          appId: '1:262318724945:android:6efefc59e65b928625a570',
          messagingSenderId: '262318724945',
          projectId: 'easydiagno-3d36c'));
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
        home:
            //WelcomeScreen()
            //SplashScreen()
            HomeScreen()
        //HospitalHome()
        );
  }
}
