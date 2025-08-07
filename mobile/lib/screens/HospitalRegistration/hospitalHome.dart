import 'dart:async';
import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Constants/constants.dart';
import 'package:easydiagno/Models/HospitalModel/HospitalAllDetails.dart';
import 'package:easydiagno/Models/HospitalModel/hospitalBaseModel.dart';
import 'package:easydiagno/Models/constantShared.dart';
import 'package:easydiagno/Services/hospital%20Module/getFullDetailsById.dart';
import 'package:easydiagno/Services/hospital%20Module/getHospitalByid.dart';
import 'package:easydiagno/screens/HospitalRegistration/SelectDepartment.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final imageUrl = "$baseUrl/static/hospital/";
//bool isRegistrationCompleted = false;

class HospitalHome extends StatefulWidget {
  final bool status;
  HospitalHome({Key? key, required this.status}) : super(key: key);
  @override
  _HospitalHomeState createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {
  ValueNotifier isLoading = ValueNotifier(true);
  ValueNotifier isFound = ValueNotifier(false);
  late ValueNotifier<bool> st;
  List<HospitalBaseModel> model = [];
  List<HospitalAllDetailsModel> hospitalFull = [];

  @override
  void initState() {
    super.initState();
    getStatus();
    initcall();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initcall();
    print("called");
  }

  initcall() async {
    print("pro $profileStatus");
    print("my model: $model");
    if (profileStatus == false) {
      print("calles 1");
      final res = await hospitalById(); //

      if (res != null) {
        print("here2");
        model = res;
        isLoading.value = false;
        isFound.value = true;
      } else {
        print("here3");
        isLoading.value = false;
        isFound.value = false;
      }
    } else {
      final res = await getFullHospitaldetailsById();
      if (res != null) {
        print("here12");
        hospitalFull = res;
        isLoading.value = false;
        isFound.value = true;
      } else {
        print("here13");
        isLoading.value = false;
        isFound.value = false;
      }
    }
  }

  getStatus() async {
    print(lid!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ValueListenableBuilder(
          valueListenable: isLoading,
          builder: (context, value, child) {
            if (isLoading.value == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (isLoading.value == false) {
              return widget.status
                  ? isFound.value
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ListView(
                            children: [
                              h20,
                              Text(
                                hospitalFull[0].hospitalName,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              h10,
                              Container(
                                height: 180,
                                width: double.infinity,
                                color: Colors.yellow,
                                child: Image.network(
                                  '$imageUrl${hospitalFull[0].img}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              h15,
                              Container(
                                width: 300,
                                height: 240,
                                decoration: const BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Column(
                                  children: [
                                    h10,
                                    Container(
                                      width: 300,
                                      height: 135,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://i.stack.imgur.com/HILmr.png',
                                              ))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Text(
                                        "${hospitalFull[0].addressLine}, ${hospitalFull[0].city}, ${hospitalFull[0].state}, ${hospitalFull[0].pincode}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 24,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color.fromARGB(
                                                255, 220, 231, 232)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Icon((Icons.phone), size: 18),
                                                Text(
                                                  "+91 ${hospitalFull[0].phoneNumber}",
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                )
                                              ],
                                            ),
                                            h10,
                                            Row(
                                              children: [
                                                Icon(
                                                  (Icons.email),
                                                  size: 18,
                                                ),
                                                Text(hospitalFull[0].email,
                                                    style:
                                                        TextStyle(fontSize: 11))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx, index) {
                                      return Container(
                                        height: 280,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 220, 231, 232),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                child: Text(
                                                  "Category",
                                                  style: TextStyle(
                                                      //color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              h15,
                                              Expanded(
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (ctx, index) {
                                                    return const Text(
                                                      "halo",
                                                      style: TextStyle(
                                                          //color: Colors.white,
                                                          ),
                                                    );
                                                  },
                                                  itemCount: 4,
                                                ),
                                              ),
                                              const Center(
                                                  child: Text(
                                                "Available days",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  //color: Colors.white,
                                                ),
                                              )),
                                              h10,
                                              Expanded(
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          childAspectRatio:
                                                              3.8),
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (ctx, index) {
                                                    return const Text(
                                                      "monday",
                                                      style: TextStyle(
                                                          //color: Colors.white,
                                                          ),
                                                    );
                                                  },
                                                  itemCount: 7,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (ctx, index) {
                                      return const SizedBox(
                                        height: 5,
                                      );
                                    },
                                    itemCount: 6),
                              )
                            ],
                          ),
                        )
                      : Center(
                          child: Text("Something went wrong"),
                        )
                  : isFound.value
                      ? Center(
                          child: Column(
                            children: [
                              h20,
                              Text(
                                model[0].hospitalName,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              h10,
                              Container(
                                height: 180,
                                width: double.infinity,
                                color: Colors.yellow,
                                child: Image.network(
                                  "$imageUrl${model[0].img}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              h15,
                              Container(
                                width: 300,
                                //height: 240,
                                decoration: const BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Column(
                                  children: [
                                    h10,
                                    Container(
                                      width: 300,
                                      height: 135,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://i.stack.imgur.com/HILmr.png',
                                              ))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        right: 20,
                                        left: 20,
                                      ),
                                      child: Text(
                                        "${model[0].addressLine}, ${model[0].city}, ${model[0].state}, ${model[0].pincode}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 24,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color.fromARGB(
                                                255, 220, 231, 232)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Icon((Icons.phone), size: 18),
                                                Text(
                                                  "+91 ${model[0].phoneNumber.toString()}",
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                )
                                              ],
                                            ),
                                            h10,
                                            Row(
                                              children: [
                                                Icon(
                                                  (Icons.email),
                                                  size: 18,
                                                ),
                                                Text(model[0].email,
                                                    style:
                                                        TextStyle(fontSize: 11))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (ctx) {
                                            return CheckBoxWidget3();
                                          }));
                                        },
                                        child: Text("Complete your profile"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Text("Something went wrong"),
                        );
            } else {
              return Container();
            }
          },
        ));
  }
}
