import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Constants/constants.dart';
import 'package:easydiagno/screens/HospitalRegistration/Registration2/widgets/specializationsection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DoctorSection extends StatefulWidget {
  const DoctorSection({super.key});

  @override
  State<DoctorSection> createState() => _DoctorSectionState();
}

final List<DoctorDetailsSubmit> allDoctorDetails = [];

class _DoctorSectionState extends State<DoctorSection> {
  @override
  Widget build(BuildContext context) {
    final list = checkedTitles.value;

    return Column(
      children: [
        list.isNotEmpty
            ? Column(
                children: [
                  for (int index = 0; index < list.length; index++)
                    Column(
                      children: [
                        DocSubSectionGroup(title: list[index]),
                        if (index <
                            list.length -
                                1) // Add space for all items except the last one
                          h10, // Adjust the height as needed
                      ],
                    ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text("No specialization selected"),
              )
      ],
    );
  }
}

class DocSubSectionGroup extends StatefulWidget {
  final String title;

  const DocSubSectionGroup({Key? key, required this.title}) : super(key: key);

  @override
  _DocSubSectionGroupState createState() => _DocSubSectionGroupState();
}

class _DocSubSectionGroupState extends State<DocSubSectionGroup> {
  List<DoctorDetails> doctorDetailsList = [DoctorDetails(title: '')];
  Map<String, TextEditingController> doctorControllers = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: float)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: border2),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      doctorDetailsList.add(DoctorDetails(title: widget.title));
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: border2,
                  ),
                ),
              ],
            ),
            for (var doctorDetails in doctorDetailsList)
              DocSubSection(
                doctorDetails: doctorDetails,
                //doctorControllers: doctorControllers,
              ),
          ],
        ),
      ),
    );
  }
}

class DocSubSection extends StatefulWidget {
  final DoctorDetails doctorDetails;
  //final Map<String, TextEditingController> doctorControllers;

  DocSubSection({
    Key? key,
    required this.doctorDetails,
  }) : super(key: key);

  @override
  State<DocSubSection> createState() => _DocSubSectionState();
}

class _DocSubSectionState extends State<DocSubSection> {
  final doctornameController = TextEditingController();
  final qualificationController = TextEditingController();

  bool doctorAdded = false;
  DoctorDetailsSubmit d1 = DoctorDetailsSubmit(
      title: '', doctorName: '', qualification: '', selectedDays: []);

  @override
  Widget build(BuildContext context) {
    return doctorAdded
        ? added(
            submitteddetails: d1,
          )
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    cursorColor: c1,
                    decoration: InputDecoration(
                      hintText: 'Doctor Name',
                    ),
                    controller: qualificationController),
                TextFormField(
                    decoration: InputDecoration(hintText: 'Qualification'),
                    controller:
                        doctornameController //widget.doctorControllers[widget.doctorDetails.qualification],
                    ),
                h5,
                Text(
                  "Add available day",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: border2),
                ),
                h5,
                buildDayDropdown(),
                h10,
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        widget.doctorDetails.doctorName =
                            widget.doctorDetails.doctorName;
                        doctorAdded = false;
                        submit(widget.doctorDetails);
                      },
                      child: Text("Add")),
                ),
                Divider(
                  thickness: 5,
                  color: border2,
                )
              ],
            ),
          );
  }

  Widget buildDayDropdown() {
    final List<String> daysOfWeek = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    return FormBuilderCheckboxGroup(
      name: 'days',
      options:
          daysOfWeek.map((day) => FormBuilderFieldOption(value: day)).toList(),
      onChanged: (value) {
        widget.doctorDetails.selectedDays =
            List<String>.from(value!.map((dynamic item) => item.toString()));
      },
    );
  }

  void submit(DoctorDetails details) {
    d1 = DoctorDetailsSubmit(
        title: details.title,
        doctorName: doctornameController.text,
        qualification: qualificationController.text,
        selectedDays: widget.doctorDetails.selectedDays);
    print(d1.selectedDays);
    print(d1.qualification);
    print(d1.doctorName);
    print(d1.title);
    allDoctorDetails.add(d1);
    final lists = allDoctorDetails;
    print(lists[4].qualification);
    setState(() {
      doctorAdded = true;
    });
  }
}

class DoctorDetails {
  final String title;
  String doctorName = '';
  String qualification = '';
  List<String> selectedDays = [];

  DoctorDetails({required this.title});
}

class added extends StatelessWidget {
  final DoctorDetailsSubmit submitteddetails;
  added({super.key, required this.submitteddetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(submitteddetails.doctorName),
        Text(submitteddetails.qualification),
        Text(submitteddetails.title),
        Text(submitteddetails.selectedDays.toString()),
        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
      ],
    );
  }
}

class DoctorDetailsSubmit {
  final String title;
  final String doctorName;
  final String qualification;
  final List<String> selectedDays;

  DoctorDetailsSubmit(
      {required this.title,
      required this.doctorName,
      required this.qualification,
      required this.selectedDays});
}
