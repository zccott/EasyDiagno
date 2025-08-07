import 'package:easydiagno/Models/AdminModel/allHospitalModel.dart';
import 'package:easydiagno/Models/AdminModel/hospitalReqModel.dart';
import 'package:easydiagno/Models/AdminModel/usersbyadminModel.dart';
import 'package:easydiagno/Services/AdminModule/vieallHospital.dart';
import 'package:easydiagno/Services/AdminModule/viewHosRequest.dart';
import 'package:easydiagno/Services/AdminModule/viewUserApi.dart';
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
List<HospitalBaseModel> hospitalss = [];
List<UsersByAdmin> userss = [];
bool isFound = false;
bool isUserFound = false;
bool isHosFound = false;

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
    initApiCalls();
    //apicall();
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

  initApiCalls() async {
    await apicall();
    await userapicall();
    await hospitalapicall();
  }

  apicall() async {
    isLoading.value = true;
    final res = await hospitalRequestApi();
    if (res != null) {
      requests = res;
      if (requests.isEmpty) {
        //isFound = false;
        isLoading.value = false;
      } else {
        //isFound = true;
        isLoading.value = false;
      }
    } else {
      //isFound = false;
      isLoading.value = false;
    }
  }

  userapicall() async {
    isLoading.value = true;
    final res = await viewUsersApi();
    if (res != null) {
      userss = res;
      if (requests.isEmpty) {
        isUserFound = false;
        isLoading.value = false;
      } else {
        isUserFound = true;
        isLoading.value = false;
      }
    } else {
      isUserFound = false;
      isLoading.value = false;
    }
  }

  hospitalapicall() async {
    isLoading.value = true;
    final res = await viewhospitalsApi();
    if (res != null) {
      hospitalss = res;
      if (requests.isEmpty) {
        isHosFound = false;
        isLoading.value = false;
      } else {
        isHosFound = true;
        isLoading.value = false;
      }
    } else {
      isHosFound = false;
      isLoading.value = false;
    }
  }
}
