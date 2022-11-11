import 'package:flutter/material.dart';
import 'package:flutter_task_pinehouse/Models/User.dart';
import 'package:flutter_task_pinehouse/Utils/Global.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;
  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: Global.height(context),
        width: Global.width(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 63,
                backgroundColor: Colors.purple,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.profilePicture),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                user.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.1),
                child: ListTile(
                  tileColor: Colors.purple[100],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  leading: const Text(
                    "Age",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Text(
                    user.age.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.1),
                child: ListTile(
                  tileColor: Colors.purple[100],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  leading: const Text(
                    "Mobile",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Text(
                    user.phoneNumber.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Global.width(context) * 0.1),
                child: ListTile(
                  tileColor: Colors.purple[100],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  leading: const Text(
                    "Department",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Text(
                    user.department,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
