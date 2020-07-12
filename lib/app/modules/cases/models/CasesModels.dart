import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CasesModel {
  String id;
  String title = '';
  String description = '';
  String teacherID;
  String position;
  String public;
  DocumentReference reference;

  CasesModel({
    this.position,
    this.id,
    this.title,
    this.description,
    this.teacherID,
    this.reference,
    this.public,
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
    map['position'] = position;
    map['public'] = public;
    return map;
  }

  static CasesModel fromMap(DocumentSnapshot map) {
    if (map == null) return null;

    return CasesModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      teacherID: map['teacherID'],
      position: map['position'],
      reference: map.reference,
      public: map['public'],
    );
  }
}
