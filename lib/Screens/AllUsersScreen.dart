import 'package:flutter/material.dart';
import 'package:flutter_task_pinehouse/Models/User.dart';
import 'package:flutter_task_pinehouse/Screens/UserDetailScreen.dart';
import 'package:flutter_task_pinehouse/Services/DatabaseService.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
      ),
      body: FutureBuilder<List<User>>(
        future: DatabaseService().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data!;
            if (users.isEmpty == true) {
              return const Center(
                child: Text("No Users"),
              );
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(users[index].profilePicture),
                    ),
                    title: Text(users[index].name),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>
                              UserDetailScreen(user: users[index]))));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
