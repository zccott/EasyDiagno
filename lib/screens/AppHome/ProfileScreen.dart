import 'package:easydiagno/screens/AdminModule/AdminHome.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileScreenBody();
  }
}

class ProfileScreenBody extends StatelessWidget {
  final ValueNotifier<bool> isFieldVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            height: h * 0.35,
            color: Colors.blue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return AdminHome();
                        }));
                      },
                      icon: Text(
                        'Edit',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      label: Icon(
                        Icons.edit_note,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Color.fromARGB(255, 118, 179, 94),
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                ProfileText(w: w, headder: 'Name', body: 'Rahul A P'),
                SizedBox(height: 10),
                ProfileText(
                    w: w, headder: 'Email', body: 'aaronrahul@gmail.com'),
                SizedBox(height: 10),
                ValueListenableBuilder<bool>(
                  valueListenable: isFieldVisible,
                  builder: (context, value, child) {
                    if (value) {
                      return Column(
                        children: [
                          SizedBox(height: 10),
                          ProfileText(w: w, headder: 'DOB', body: '26/10/2003'),
                          SizedBox(height: 10),
                          ProfileText(w: w, headder: 'Gender', body: 'Male'),
                          SizedBox(height: 10),
                          ProfileText(
                              w: w, headder: 'Phone', body: '+91 8505625458'),
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      isFieldVisible.value = !isFieldVisible.value;
                    },
                    child: Text(
                      "Complete your profile",
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    required this.w,
    required this.headder,
    required this.body,
  }) : super(key: key);

  final double w;
  final String headder;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: w * 0.25,
          child: Text(
            headder,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 38, 145, 232),
            ),
          ),
        ),
        Text(
          body,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Divider(),
      ],
    );
  }
}
