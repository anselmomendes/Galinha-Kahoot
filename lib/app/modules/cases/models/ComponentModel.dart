import 'package:uuid/uuid.dart';

class ComponentModel {
  String id;
  String idCases;
  String position;
  String type;
  String value;
  String page;

  ComponentModel(
      {this.id,
      this.idCases,
      this.position,
      this.type,
      this.value,
      this.page}) {
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

  static ComponentModel fromMap(Map<String, dynamic> map) {
    return ComponentModel(
      id: map['id'],
      idCases: map['idCases'],
      position: map['position'],
      type: map['type'],
      value: map['value'],
      page: map['page'],
    );
  }
}
