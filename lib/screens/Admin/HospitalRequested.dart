import 'package:easydiagno/Services/AdminModule/approvereq.dart';
import 'package:easydiagno/Services/AdminModule/rejectHospital.dart';
import 'package:easydiagno/screens/Admin/AdminHome.dart';
import 'package:easydiagno/screens/AppHome/ClinicPage.dart';
import 'package:easydiagno/screens/HospitalRegistration/hospitalHome.dart';
import 'package:flutter/material.dart';

class HospitalsRequested extends StatefulWidget {
  const HospitalsRequested({super.key});

  @override
  State<HospitalsRequested> createState() => _HospitalsRequestedState();
}

class _HospitalsRequestedState extends State<HospitalsRequested> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: requests.isEmpty
              ? Center(
                  child: Text("No pending request"),
                )
              : ListView.separated(
                  itemBuilder: (ctx, index) {
                    final item = requests[index];
                    return ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return ClinicPage();
                        }));
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('$imageUrl${item.img}'),
                      ),
                      title: Text(item.hospitalName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.licenceNumber),
                          Text(
                              "${item.addressLine}, ${item.city}, ${item.state}, ${item.pincode}"),
                          Text(item.email),
                          Text(item.phoneNumber.toString()),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(100, 35))),
                                onPressed: () {
                                  approveReq(item.loginId);
                                },
                                icon: Icon(
                                  Icons.check,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                label: Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ElevatedButton.icon(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(100, 35))),
                                onPressed: () {
                                  rejectReq(item.loginId);
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: Colors.red,
                                ),
                                label: Text(
                                  "Decline",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: requests.length)),
    );
  }

  approveReq(int id) async {
    final res = await hospitalRequestApprove(id);
    if (res == true) {
      requests.removeWhere((element) => element.loginId == id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("hospital Approved Successfully"),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 8)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("somthing went wrong"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 8)));
    }

    setState(() {});
  }

  rejectReq(int id) async {
    final res = await hospitalRequestReject(id);
    if (res == true) {
      requests.removeWhere((element) => element.loginId == id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Hospital Removed"),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 8)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("something went wrong"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 8)));
    }

    setState(() {});
  }
}
