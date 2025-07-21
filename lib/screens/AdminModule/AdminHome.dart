import 'package:easydiagno/screens/AdminModule/HospitalsRequested.dart';
import 'package:easydiagno/screens/AdminModule/HospitalsRegistered.dart';
import 'package:easydiagno/screens/AdminModule/UsersRegistered.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _index = 0;

  final pages = [
    HospitalsRegistered(),
    HospitalsRequested(),
    UsersRegistered()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        backgroundColor: const Color.fromARGB(255, 107, 187, 252),
      ),
      body: SafeArea(child: pages[_index]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_rounded), label: "Hospital"),
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions), label: "Request"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users")
        ],
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
