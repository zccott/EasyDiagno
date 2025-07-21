import 'package:easydiagno/Constants/constants.dart';
import 'package:flutter/material.dart';

final mylist = [1, 2, 3, 4, 5];
final mylist1 = [1, 2, 3];
final mylist2 = [1, 2, 3, 4, 5, 6, 7];

class ClinicPage extends StatelessWidget {
  const ClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            h20,
            const Text(
              "Hospital Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            h10,
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.yellow,
            ),
            h15,
            Container(
              width: 300,
              height: 240,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 135,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      right: 20,
                      left: 20,
                    ),
                    child: Text(
                      "adress bsbhd bjbnfj fbddfb fjhsjfh fhfhsjdh bdssdh bhfjdhfj hfhdfhdf hdhfjhdf",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 24,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 220, 231, 232)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Row(
                            children: [
                              Icon((Icons.phone), size: 18),
                              Text(
                                "+91 8590419023",
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          ),
                          h10,
                          const Row(
                            children: [
                              Icon(
                                (Icons.email),
                                size: 18,
                              ),
                              Text("halo@gmail.com",
                                  style: TextStyle(fontSize: 11))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < mylist.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      height: 300,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text("Category")),
                            for (int i = 0; i < mylist1.length; i++)
                              Column(
                                children: [
                                  Container(
                                    height: 35,
                                    child: ListTile(
                                      title: Text("halo"),
                                    ),
                                  )
                                ],
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Available days'),
                            h5,
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: GridView.builder(
                                  itemBuilder: (ctx, index) {
                                    return Text('data');
                                  },
                                  itemCount: 7,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 3.5,
                                          crossAxisCount: 3),
                                ),
                              ),
                            )
                            // for (int i = 0; i < mylist2.length; i++)
                            //   Column(
                            //     children: [
                            //       Container(
                            //         height: 20,
                            //         child: ListTile(
                            //           title: Text("names"),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              )
            // Container(
            //   height: 100,
            //   width: 100,
            //   color: Colors.red,
            //   child: Column(
            //     children: [Text("halo"), Divider()],
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
