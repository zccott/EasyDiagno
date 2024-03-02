import 'package:flutter/material.dart';

class UsersRegistered extends StatelessWidget {
  const UsersRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                  ),
                  title: Text("User"),
                  subtitle: Text("aronrahul@gmail.com"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: 10)),
    );
  }
}
