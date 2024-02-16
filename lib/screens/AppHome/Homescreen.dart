import 'package:easydiagno/screens/AppHome/ChatBotScreen.dart';
import 'package:easydiagno/screens/AppHome/ClinicHome.dart';
import 'package:easydiagno/screens/AppHome/ProfileScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text("EasyDiagno"),
            bottom: const TabBar(tabs: [
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
                  padding: const EdgeInsets.only(right: 12, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const ProfileScreen();
                      }));
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        "R",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
          body: TabBarView(children: [ChatBotScreen(), ClinicHome()]),
        )));
  }
}
