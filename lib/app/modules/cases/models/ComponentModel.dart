import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ComponentModel {
  String id;
  String idCases;
  int position;
  String type;
  String value;
  String page;
  DocumentReference reference;

  ComponentModel(
      {this.id,
      this.idCases,
      this.position,
      this.type,
      this.value,
      this.page,
      this.reference}) {
    id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map['id'] = id;
    map['idCases'] = idCases;
    map['position'] = position;
    map['type'] = type;
    map['value'] = value;
    map['page'] = page;
    return map;
  }

  factory ComponentModel.fromMap(DocumentSnapshot map) => ComponentModel(
      id: map['id'],
      idCases: map['idCases'],
      position: map['position'],
      type: map['type'],
      value: map['value'],
      page: map['page'],
      reference: map.reference);
}
