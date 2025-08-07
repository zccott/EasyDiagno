import 'package:easydiagno/screens/AppHome/ClinicPage.dart';
import 'package:flutter/material.dart';

class HospitalsRequested extends StatelessWidget {
  const HospitalsRequested({super.key});

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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address kozhikode kerala india asia"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(100, 35))),
                            onPressed: () {},
                            icon: Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.green,
                            ),
                            label: Text(
                              "Accept",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(100, 35))),
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              size: 18,
                              color: Colors.red,
                            ),
                            label: Text(
                              "Decline",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
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
              itemCount: 10)),
    );
  }
}
