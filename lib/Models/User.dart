import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String id;
  int age;
  int phoneNumber;
  String department;
  String profilePicture;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.department,
    required this.profilePicture,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'phoneNumber': phoneNumber,
        'department': department,
        'profilePicture': profilePicture,
      };

  factory User.fromQueryDocumentSnapshot(QueryDocumentSnapshot<Object?> doc) {
    return User(
      id: doc.get("id"),
      name: doc.get("name"),
      age: doc.get("age"),
      phoneNumber: doc.get("phoneNumber"),
      department: doc.get("department"),
      profilePicture: doc.get("profilePicture"),
    );
  }
}
