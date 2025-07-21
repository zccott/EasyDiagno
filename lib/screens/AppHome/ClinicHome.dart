import 'dart:convert';

import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/HospitalModel/getSpecialisation.dart';
import 'package:easydiagno/screens/AppHome/ClinicPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClinicHome extends StatefulWidget {
  String? department;
  ClinicHome({super.key, this.department});

  @override
  State<ClinicHome> createState() => _ClinicHomeState();
}

class _ClinicHomeState extends State<ClinicHome> {
  String? categoryInitial;
  List<Specialisation> listtitles = [];

  // List<String> categoryList = [
  //   'Allergy Immunology',
  //   'Anesthesiology',
  //   'Dermatology',
  //   'Emergency Medicine',
  //   'Endocrinology',
  //   'Neurology',
  //   'Gynecology',
  //   'Ophthalmology',
  //   'Orthopedics',
  //   'Otolaryngology',
  //   'Pediatrics',
  //   'Psychiatry',
  //   'Surgery',
  //   'Urology',
  // ];


  List<String> categoryList = [
    'Anesthesiology',
    'Dermatology',
    'Emergency Medicine',
    'Endocrinology',
    'Neurology',
    'General Physician',
    'Gynecology',
    'Ophthalmology',
    'Orthopedics',
    'Otolaryngology',
    'Pediatrics',
    'Psychiatry',
    'Surgery',
    'Urology',
  ];
  List hospital_names = [
    "Baby Memorial Hospital (BMH)",
    "Kozhikode Medical College",
    "National Hospital",
    "Metro International cardiac care Hospital"
  ];

  @override
  void initState() {
    super.initState();
    getSpecialisations();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: height / 17,
                    child: CupertinoSearchTextField(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //Open the filter dropdown when the filter button is pressed
                    showFilterDropdown();
                  },
                  icon: Icon(Icons.filter_list),
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Text(
              "Hospitals",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: height / 50,
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return ClinicPage();
                          }));
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/bg.jpg')),
                              color: Colors.black,
                              height: height / 5.5,
                              width: width / 2.5,
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.amber,
                                height: height / 5.5,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          hospital_names[index],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: hospital_names.length),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget filterDropdown() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          children: [
            DropdownButton(
              hint: Text("Select Category"),
              value: categoryInitial,
              items: listtitles.map((e) {
                return DropdownMenuItem(
                  child: Text(e.specialisation),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  categoryInitial = value.toString();
                });
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        );
      },
    );
  }

  //Show the filter dropdown
  void showFilterDropdown() {
    // Dialog box used to display the dropdown
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.only(bottom: 300),
          content: filterDropdown(),
        );
      },
    );
  }

  void getSpecialisations() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/viewspecialisation'));
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          print(response.body);
          listtitles = data
              .map((item) => Specialisation(
                    description: item['description'],
                    specialisation: item['specialisation'],
                    specialisationid: item['specialisationid'],
                  ))
              .toList();
        });
      } else {
        print('Failed to load specialisations');
      }
    } catch (e) {
      print("exceptin : $e");
    }
  }
}
