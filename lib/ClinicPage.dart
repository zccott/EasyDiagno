import 'package:easydiagno/Constants/constants.dart';
import 'package:flutter/material.dart';

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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text("Category"),
                            ),
                            h15,
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return const Text("halo");
                                },
                                itemCount: 5,
                              ),
                            ),
                            const Center(child: Text("Available days")),
                            h10,
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 3.8),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return const Text("monday");
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
                  itemCount: 10),
            )
          ],
        ),
      )),
    );
  }
}
