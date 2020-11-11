import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String name;
  String profile_pic;
  String role;
  String uid;
  String university;
  List classes;

  StudentModel(
      {this.name, this.profile_pic, this.role, this.uid, this.university});

  factory StudentModel.fromDocument(DocumentSnapshot doc) => StudentModel(
      name: doc["name"],
      profile_pic: doc["profile_pic"],
      role: doc["role"],
      uid: doc["uid"],
      university: doc["university"]);
}
