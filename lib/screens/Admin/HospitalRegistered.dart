import 'package:easydiagno/Services/AdminModule/hospitaldeleteapi.dart';
import 'package:easydiagno/screens/Admin/AdminHome.dart';
import 'package:easydiagno/screens/AppHome/ClinicPage.dart';
import 'package:flutter/material.dart';

class HospitalsRegistered extends StatelessWidget {
  const HospitalsRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: hospitalss.isEmpty
              ? Center(
                  child: Text("No Hospitals"),
                )
              : ListView.separated(
                  itemBuilder: (ctx, index) {
                    final hos = hospitalss[index];
                    return ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return ClinicPage();
                        }));
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                      ),
                      title: Text(hos.hospitalName),
                      subtitle: Text(
                          "${hos.addressLine}, ${hos.city}, ${hos.state}, ${hos.pincode}"),
                      trailing: IconButton(
                          onPressed: () {
                            hospitaldelete(hos.hospitalId);
                          },
                          icon: Icon(Icons.delete)),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: hospitalss.length)),
    );
  }
}
