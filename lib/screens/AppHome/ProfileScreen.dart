import 'package:easydiagno/Constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             h20,
          Center (child: Text("Profile", style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,),),),
           h10,
          Center( child: CircleAvatar(radius: 65,backgroundColor: Colors.black45,)),
          h40,
          ProfileText(w: w, headder: 'Name', body: 'Rahul AP'),
          h10,
          ProfileText(w: w, headder: 'Email', body: 'aaronrahul@gmail.com'),
          h10,
          Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: Column(
              children: [
                Text("DOB",style: TextStyle(fontSize: 20),),
                Text("Gender"),
                Text("Height"),
                Text("Weight"),
                Text("Adderss"),
                Text("Phone"),
                
              ],
            )
          //   Column(
          //     children: [
          //                 ProfileText(w: w, headder: 'DOB', body: '16-09-2003',),
          // h10,
          // ProfileText(w: w, headder: 'Gender', body: 'Male'),
          // h10,
          // ProfileText(w: w, headder: 'Height', body: '170.9cm'),
          // h10,
          // ProfileText(w: w, headder: 'Weight', body: '69kg'),
          // h10,
          // ProfileText(w: w, headder: 'Address', body: 'kakkur'),
          // h10,
          // ProfileText(w: w, headder: 'Phone', body: '999999999'),
          //     ],
          //   ),
          )
          ],
        ),
      )
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    super.key,
    required this.w,
    required this.headder,
    required this.body,

  });

  final double w;
  final String headder;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: w*0.25,
          child: Text(headder, style: TextStyle(fontSize: 20),)),
        Text(":"),
        w5,
        Text(body,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
      ],
    );
  }
}
