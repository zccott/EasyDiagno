import 'package:easydiagno/Models/constantShared.dart';
import 'package:easydiagno/Services/UserModule/getHospitalbySpec.dart';
import 'package:easydiagno/Services/UserModule/masgeReplyApi.dart';
import 'package:easydiagno/screens/AppHome/ChatBotScreen.dart';
import 'package:easydiagno/screens/AppHome/ClinicHome.dart';
import 'package:easydiagno/screens/AppHome/ProfileScreen.dart';
import 'package:easydiagno/screens/AppHome/messageScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  List<String> userMsg = [];
  List<String> systemMsg = [];

  bool ifYes = false;

  @override
  void initState() {
    initialMessage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text("EasyDiagno"),
            bottom: const TabBar(tabs: [
              Tab(
                //icon: Icon(Icons.chat),
                text: "ChatBot",
              ),
              Tab(
                text: "Hospitals",
                //icon: Icon(Icons.medical_services),
              )
            ]),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 12, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return ProfileScreen();
                      }));
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        "R",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
          body: TabBarView(
            children: [
              Container(
                child: Column(
                  children: [
                    Expanded(child: MessagesScreen(messages: messages)),
                    Container(
                      padding: EdgeInsets.all(10),
                      // color: Colors.deepPurple,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: height / 12,
                            width: 30,
                            child: TextFormField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: "Type here",
                                filled: true,
                                fillColor: Color.fromARGB(255, 241, 235, 235),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 29, 114, 184),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                ifYes
                                    ? ifYesFunc()
                                    : ifNofunc(_controller.text);
                                // Handle send button press
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

//Hospital view
              ClinicHome()
            ],
          ),
        )));
  }

  sendMessage(String text) async {
    print("symptom : $text");
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      userMsg.add(text);
      setState(() {
        // addMessage(text, true);
      });

      final responce = await msges(text);
      if (responce != null) {
        print("responce 2 : ${responce.task}");
        List<String> rply = responce.task.split("#");
        department = rply[1];
        print("rply : $rply");

        setState(() {
          addMessage(rply[0]);
          addButton(ElevatedButton(
              onPressed: () {
                hospitalByCategory(department!);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => ClinicHome(),
                // ));
              },
              child: Text("View Hospitals")));
        });

        // if (rply.split('*')[1] == 'disease') {
        // setState(() {
        //   //addMessage(responce.task.toString());
        //   addButton(ElevatedButton(
        //       onPressed: () {}, child: Text("View Hospitals")));
        // });
        // } else {
        //   setState(() {
        //     systemMsg.add('Confirm your symptoms, send Yes/No');
        //     //addMessage(responce.task.toString());
        //   });
        // }
      }
      ;
    }
  }

  addMessage(String message, [bool isUserMessage = false]) {
    messages
        .add({'message': message.toString(), 'isUserMessage': isUserMessage});
  }

  addButton(ElevatedButton button, [bool isUserMessage = false]) {
    messages.add({'message': button, 'isUserMessage': isUserMessage});
  }

  initialMessage() async {
    await addMessage("Hi, Welcome to EasyDiagno");
    await addMessage("Send your symptoms");
    setState(() {});
  }

  ifYesFunc() async {
    await sendMessage(_controller.text);
    _controller.clear();
  }

  ifNofunc(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      userMsg.add(text);
      setState(() {
        addMessage(text, true);
      });
      _controller.clear();
      if (systemMsg.isEmpty ||
          systemMsg[systemMsg.length - 1] == "Send your symptoms") {
        setState(() {
          systemMsg.add('Confirm your symptoms, send Yes/No');
          addMessage("Confirm your symptoms, send Yes/No");
        });
      } else if (systemMsg[systemMsg.length - 1] ==
          "Confirm your symptoms, send Yes/No") {
        if (userMsg[userMsg.length - 1].toLowerCase() == "yes") {
          await sendMessage(userMsg[userMsg.length - 2]);
        } else if (userMsg[userMsg.length - 1].toLowerCase() == "no") {
          systemMsg.add('Send your symptoms');
          await addMessage("Send your symptoms");
        } else {
          systemMsg.add('please send a valid reply, Yes/No');
          await addMessage("please send a valid reply, Yes/No");
        }
      } else if (systemMsg[systemMsg.length - 1] ==
          "please send a valid reply, Yes/No") {
        if (userMsg[userMsg.length - 1].toLowerCase() == "yes") {
          await sendMessage(userMsg[userMsg.length - 2]);
        } else if (userMsg[userMsg.length - 1].toLowerCase() == "no") {
          await addMessage("Send your symptoms");
        } else {
          await addMessage("please send a valid reply, Yes/No");
        }
      }
      // else if(systemMsg[systemMsg.length] == "Send your symptoms"){
      //   if (userMsg[userMsg.length-1].toLowerCase() == "yes" ) {
      //     await sendMessage(userMsg[userMsg.length-1]);
      //   }
      //   else{
      //     await addMessage("Send your symptoms");
      //   }
      //}
    }
  }
}
