import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/HospitalModel/getSpecialisation.dart';
import 'package:easydiagno/screens/HospitalRegistration/addDoctorScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CheckBoxWidget3 extends StatefulWidget {
  CheckBoxWidget3({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget3> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget3> {
  final selectAllItems = Specialisation(
    description: 'Select All',
    specialisation: 'Select All',
    specialisationid: -1,
  );
  List<Specialisation> listtitles = [];

  final ValueNotifier<List<Specialisation>> checkedSpecialisations =
      ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    getSpecialisations();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: UniqueKey(),
        children: [
          Text(
            "Select Specialisation",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15),
          Container(
            width: w * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildGroupselectionCheckbox(selectAllItems),
                  ...listtitles.map(buildCheckBox),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              checkedSpecialisations.value = listtitles
                  .where((specialisation) => specialisation.selected)
                  .toList();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorSection2(specialization: checkedSpecialisations.value),));
              print(checkedSpecialisations.value[0].specialisationid);
              // Call a method or navigate to another screen passing the selected specialisations
            },
            child: Text("Next"),
          )
        ],
      ),
    );
  }

  Widget buildCheckBox(Specialisation specialisation) {
    return CheckboxListTile(
      value: specialisation.selected,
      title: Text(specialisation.specialisation),
      onChanged: (value) {
        setState(() {
          specialisation.selected = value!;
          selectAllItems.selected =
              listtitles.every((element) => element.selected);
        });
      },
    );
  }

  Widget buildGroupselectionCheckbox(Specialisation selectall) {
    return CheckboxListTile(
      value: selectAllItems.selected,
      title: Text(selectall.description),
      onChanged: (value) {
        setState(() {
          selectAllItems.selected = value!;
          listtitles.forEach((element) => element.selected = value);
          checkedSpecialisations.value = listtitles
              .where((specialisation) => specialisation.selected)
              .toList();
        });
      },
    );
  }

  void getSpecialisations() async {
    final response = await http.get(Uri.parse('$baseUrl/viewspecialisation'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        listtitles = data
            .map((item) => Specialisation(
                  description: item['description'],
                  specialisation: item['specialisation'],
                  specialisationid: item['specialisationid'],
                ))
            .toList();
      });
    } else {
      throw Exception('Failed to load specialisations');
    }
  }
}
