import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task_pinehouse/Models/User.dart';

class DatabaseService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  void addNewUser(User user) async {
    final doc = userCollection.doc();
    user.id = doc.id;
    await doc.set(user.toJson());
  }

  Future<List<User>> getUsers() async {
    final result = await userCollection.get();
    return result.docs.map((e) => User.fromQueryDocumentSnapshot(e)).toList();
  }
}
