import 'package:easydiagno/Models/AdminModel/hospitalReqModel.dart';
import 'package:easydiagno/Services/AdminModule/viewHosRequest.dart';
import 'package:easydiagno/screens/Admin/HospitalRegistered.dart';
import 'package:easydiagno/screens/Admin/HospitalRequested.dart';
import 'package:easydiagno/screens/Admin/UserRegistered.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

List<HospitalRequestModel> requests = [];
bool isFound = false;

class _AdminHomeState extends State<AdminHome> {
  int _index = 0;

  final pages = [
    HospitalsRegistered(),
    HospitalsRequested(),
    UsersRegistered()
  ];

  ValueNotifier<bool> isLoading = ValueNotifier(true);

  @override
  void initState() {
    apicall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        backgroundColor: const Color.fromARGB(255, 107, 187, 252),
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, value, child) {
          if (isLoading.value == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return pages[_index];
          }
        },
      )),
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

  apicall() async {
    isLoading.value = true;
    final res = await hospitalRequestApi();
    if (res != null) {
      requests = res;
      if (requests.isEmpty) {
        isFound = false;
        isLoading.value = false;
      } else {
        isFound = true;
        isLoading.value = false;
      }
    } else {
      isFound = false;
      isLoading.value = false;
    }
  }
}
