import 'package:easydiagno/Services/AdminModule/userdeleteapi.dart';
import 'package:easydiagno/Services/AdminModule/userdeleteloginapi.dart';
import 'package:easydiagno/screens/Admin/AdminHome.dart';
import 'package:flutter/material.dart';

class UsersRegistered extends StatefulWidget {
  const UsersRegistered({super.key});

  @override
  State<UsersRegistered> createState() => _UsersRegisteredState();
}

class _UsersRegisteredState extends State<UsersRegistered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: userss.isEmpty
              ? Center(
                  child: Text("No Users"),
                )
              : ListView.separated(
                  itemBuilder: (ctx, index) {
                    final user = userss[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Text(
                          user.name.substring(0, 1),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: IconButton(
                          onPressed: () async {
                            await userdelete(user.userId);
                            await userdeletelogin(user.loginId);
                            userss.removeWhere(
                                (element) => element.userId == user.userId);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete)),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: userss.length)),
    );
  }
}
