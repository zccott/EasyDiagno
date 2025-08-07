// import 'package:flutter/material.dart';

// class ChatBotScreen extends StatefulWidget {
//   ChatBotScreen({super.key});

//   @override
//   State<ChatBotScreen> createState() => _ChatBotScreenState();
// }

// class _ChatBotScreenState extends State<ChatBotScreen> {
//   List<Map<String, String>> chatMessages = [
//     {'sender': 'Alice', 'message': 'Hi there!'},
//     {
//       'sender': 'Bob',
//       'message': 'Hello! How are you? This is a longer message.'
//     },
//     {'sender': 'Alice', 'message': 'Have you seen the latest movie?'},
//     {'sender': 'Bob', 'message': 'No, I haven\'t. Is it good?'},
//     {'sender': 'Alice', 'message': 'Yes, it\'s really entertaining!'},
//     {
//       'sender': 'Bob',
//       'message': 'I ll check it out. Thanks for the recommendation!'
//     },
//     {'sender': 'Alice', 'message': 'Any plans for the weekend?'},
//     {'sender': 'Bob', 'message': 'I might go hiking. How about you?'},
//     {'sender': 'Alice', 'message': 'I m planning to relax and read a book.'},
//     {'sender': 'Bob', 'message': 'Sounds nice! Enjoy your weekend.'},
//     {'sender': 'Alice', 'message': 'Thanks! You too!'},
//     {'sender': 'Alice', 'message': 'Have you seen the latest movie?'},
//     {'sender': 'Bob', 'message': 'No, I haven\'t. Is it good?'},
//     {'sender': 'Alice', 'message': 'Yes, it\'s really entertaining!'},
//     {
//       'sender': 'Bob',
//       'message': 'I ll check it out. Thanks for the recommendation!'
//     },
//     {'sender': 'Alice', 'message': 'Any plans for the weekend?'},
//     {'sender': 'Bob', 'message': 'I might go hiking. How about you?'},
//     {'sender': 'Alice', 'message': 'I m planning to relax and read a book.'},
//     {'sender': 'Bob', 'message': 'Sounds nice! Enjoy your weekend.'},
//     {'sender': 'Alice', 'message': 'Thanks! You too!'},

//     // Add more chat messages as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     //var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return Align(
//                   alignment: chatMessages[index]['sender'] == 'Alice'
//                       ? Alignment.centerLeft
//                       : Alignment.centerRight,
//                   child: Container(
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width *
//                           0.7, // Adjust the width constraint as needed
//                     ),
//                     padding: EdgeInsets.all(8.0),
//                     margin: EdgeInsets.symmetric(vertical: 4.0),
//                     decoration: BoxDecoration(
//                       color: chatMessages[index]['sender'] == 'Alice'
//                           ? Colors.blue
//                           : Color.fromARGB(255, 126, 122, 122),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Text(
//                       chatMessages[index]['message']!,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 );
//               },
//               itemCount: chatMessages.length,
//             ),
//           ),
//           Container(
//             height: height / 10,
//             padding: EdgeInsets.all(10.0),
//             // Set the color you want for the chat field
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Container(
//                   height: height / 12,
//                   width: 30,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: "Type here",
//                       filled: true,
//                       fillColor: Color.fromARGB(255, 241, 235, 235),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 )),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 29, 114, 184),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.send,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       // Handle send button press
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
