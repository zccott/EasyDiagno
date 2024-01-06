import 'package:easydiagno/screens/ChatBotScreen.dart';
import 'package:easydiagno/screens/ClinicHome.dart';
import 'package:easydiagno/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("profile"),
                ),
                ListTile(
                    title: Text("Settings"), leading: Icon(Icons.settings)),
                ListTile(title: Text("Help"), leading: Icon(Icons.help)),
                ListTile(
                    title: Text("Contact us"),
                    leading: Icon(Icons.contact_support)),
              ]),
            ),
          ),
          appBar: AppBar(
            title: Text("EasyDiagno"),
            bottom: TabBar(tabs: [
              Tab(
                //icon: Icon(Icons.chat),
                text: "ChatBot",
              ),
              Tab(
                text: "Hospitals",
                //icon: Icon(Icons.medical_services),
              )
            ]),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    signOut(context);
                  },
                  icon: Icon(Icons.logout),
                ),
              )
            ],
          ),
          body: TabBarView(children: [ChatBotScreen(), ClinicHome()]),
        )));
  }

  signOut(BuildContext context) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return WelcomeScreen();
    }), (route) => false);
  }
}
