import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CasesModel {
  String id;
  final String title;
  final String description;
  final String teacherID;
  DocumentReference reference;

  CasesModel({
    this.id,
    this.title,
    this.description,
    this.teacherID,
    this.reference,
  }) {
    id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['teacherID'] = teacherID;
    map['reference'] = reference;
    return map;
  }

  static CasesModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CasesModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      teacherID: map['teacherID'],
    );
  }
}
