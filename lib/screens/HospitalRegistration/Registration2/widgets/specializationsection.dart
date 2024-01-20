import 'package:easydiagno/Models/HospitalModel/regscreen2/specialisationModel.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<String>> checkedTitles = ValueNotifier([]);

class CheckBox2 extends StatefulWidget {
  final GlobalKey<CheckBox2State> checkBoxKey;

  CheckBox2({Key? key})
      : checkBoxKey = GlobalKey<CheckBox2State>(),
        super(key: key);

  @override
  CheckBox2State createState() => CheckBox2State();
}

late Specialization allChecked;

class CheckBox2State extends State<CheckBox2> {
  final allNotification = Checkboxclass(title: 'Select all');
  final listtitles = [
    Checkboxclass(title: 'Gastrology'),
    Checkboxclass(title: 'Orthology'),
    Checkboxclass(title: 'Gynacology'),
    Checkboxclass(title: 'Cardiology'),
    Checkboxclass(title: 'Skin Care'),
    Checkboxclass(title: 'Neurology'),
    Checkboxclass(title: 'Ophthalmology'),
    Checkboxclass(title: 'Neurology'),
    Checkboxclass(title: 'Neurology'),
    Checkboxclass(title: 'Neurology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildGroupcheckBox(allNotification),
        Divider(),
        ...listtitles.map(buildCheckbox) //.toList(),
      ],
    );
  }

  Widget buildCheckbox(Checkboxclass check) => CheckboxListTile(
        value: check.value,
        title: Text(check.title),
        onChanged: (value) {
          setState(() {
            check.value = value!;
            allNotification.value = listtitles.every((item) => item.value);
            updateCheckedTitles();
          });
        },
      );

  void updateCheckedTitles() {
    final updatedCheckbox = listtitles
        .where((checkbox) => checkbox.value)
        .map((checkbox) => checkbox.title)
        .toList();

    checkedTitles.value = updatedCheckbox;
    allChecked = Specialization(specilization: checkedTitles.value);
  }

  Widget buildGroupcheckBox(Checkboxclass checkbox) => CheckboxListTile(
        value: checkbox.value,
        title: Text(checkbox.title),
        onChanged: toggleGroupCheckbox,
      );

  void toggleGroupCheckbox(bool? value) {
    if (value == null) return;

    setState(() {
      allNotification.value = value;
      listtitles.forEach((element) => element.value = value);
      updateCheckedTitles();
    });
  }
}

class Checkboxclass {
  final String title;
  bool value;

  Checkboxclass({required this.title, this.value = false});
}


// import 'package:flutter/material.dart';
// import 'package:hospitalmodule/Application/Registration2/reg2_bloc.dart';
// import 'package:hospitalmodule/Constants/constants.dart';
// import 'package:hospitalmodule/screens/Registration2/registratinScreen2.dart';

// List checkedTitles = [];

// class CheckBox2 extends StatefulWidget {
//   final Reg2Bloc regbloc;
//   CheckBox2({super.key, required this.regbloc});

//   @override
//   State<CheckBox2> createState() => _CheckBox2State();
// }

// class _CheckBox2State extends State<CheckBox2> {
  
//   final allNotification = Checkboxclass(title: 'Select all');

//   final listtitles = [
//     Checkboxclass(title: 'Gastrology'),
//     Checkboxclass(title: 'Orthology'),
//     Checkboxclass(title: 'Gynacology'),
//     Checkboxclass(title: 'Cardiology'),
//     Checkboxclass(title: 'Skin Care'),
//     Checkboxclass(title: 'Neurology'),
//     Checkboxclass(title: 'Ophthalmology'),
//     Checkboxclass(title: 'Neurology'),
//     Checkboxclass(title: 'Neurology'),
//     Checkboxclass(title: 'Neurology'),
//   ];

//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildGroupcheckBox(allNotification),
//         Divider(),
//         ...listtitles.map(buildCheckbox).toList(),
//       ],
//     );
//   }

//   Widget buildCheckbox(Checkboxclass check) => CheckboxListTile(
//         value: check.value,
//         title: Text(check.title),
//         onChanged: (value) {
//           widget.regbloc.add(checkBoxclickedEvent());
//           setState(() {
//             check.value = value!;
//             allNotification.value = listtitles.every((item) => item.value);
//             updateCheckedTitles();
//           });
//         },
//       );

//   void updateCheckedTitles() {
//     final updatedCheckbox = listtitles
//         .where((checkbox) => checkbox.value)
//         .map((checkbox) => checkbox.title)
//         .toList();

//     checkedTitles = updatedCheckbox;
//   }

//   Widget buildGroupcheckBox(Checkboxclass checkbox) => CheckboxListTile(
//         value: checkbox.value,
//         title: Text(checkbox.title),
//         onChanged: toggleGroupCheckbox,
//       );

//   void toggleGroupCheckbox(bool? value) {
//     if (value == null) return;

//     setState(() {
//       allNotification.value = value;
//       listtitles.forEach((element) => element.value = value);
//       updateCheckedTitles();
//     });
//   }
// }


// class Checkboxclass {
//   final String title;
//   bool value;

//   Checkboxclass({required this.title, this.value = false});
// }


