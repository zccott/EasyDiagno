import 'package:easydiagno/screens/AppHome/ClinicPage.dart';
import 'package:flutter/material.dart';

class HospitalsRegistered extends StatelessWidget {
  const HospitalsRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
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
                  title: Text("Hospital Name"),
                  subtitle: Text("Address"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: 10)),
    );
  }
}
