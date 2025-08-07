import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Constants/constants.dart';
import 'package:easydiagno/Models/HospitalModel/regscreen1/basicdetailsModel.dart';
import 'package:easydiagno/screens/HospitalRegistration/Registration2/widgets/addDoctorsection.dart';
import 'package:easydiagno/screens/HospitalRegistration/Registration2/widgets/specializationsection.dart';
import 'package:easydiagno/screens/HospitalRegistration/successfullyRegScreen.dart';
//import 'package:easydiagno/screens/easydiagnoscreens/hospitalRegistration.dart';
import 'package:flutter/material.dart';

class RegScreen2 extends StatefulWidget {
  final Reg1Data reg1data;
  RegScreen2({super.key, required this.reg1data});

  @override
  State<RegScreen2> createState() => _RegScreen2State();
}

class _RegScreen2State extends State<RegScreen2> {
  final GlobalKey<CheckBox2State> checkBoxKey = GlobalKey<CheckBox2State>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text("Specialization",
                style: TextStyle(
                    fontSize: 18, color: c2, fontWeight: FontWeight.bold)),
            h10,
            Center(
              child: Container(
                height: h * 0.4,
                width: w * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lt,
                    border: Border.all(
                      color: c1,
                    )),
                child: SingleChildScrollView(
                  child: CheckBox2(
                    key: checkBoxKey,
                  ),
                ),
              ),
            ),
            h15,
            Text("Add doctors",
                style: TextStyle(
                    fontSize: 18, color: c2, fontWeight: FontWeight.bold)),
            h5,
            Text("Add your doctors for the selected Specialization",
                style: TextStyle(fontSize: 12, color: texthint)),
            h15,
            ValueListenableBuilder(
              valueListenable: checkedTitles,
              builder: (BuildContext context, value, Widget? child) {
                return DoctorSection();
              },
            ),
            h20,
            ElevatedButton(
                onPressed: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Successfullyregistered();
                  }));
                  // final a = await submit();
                  // print(a.reg1data);
                  //registration();
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
  // Future<HospitalRegistration> submit() async{
  //   HospitalRegistration hos = await HospitalRegistration(reg1data: widget.reg1data, specializations: allChecked, submittedDoctors: allDoctorDetails);
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> RegistrationDoneScreen()));
  //   return hos;
}
