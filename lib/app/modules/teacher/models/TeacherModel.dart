import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherModel {
  int id;
  String name;
  String sobrenome;
  String universidade;
  String discMinistradas;
  String email;
  DocumentReference reference;
  int idClass;
  int idTurma;

  TeacherModel({
    this.id,
    this.name,
    this.sobrenome,
    this.universidade,
    this.reference,
    this.discMinistradas,
    this.email,
    this.idClass,
    this.idTurma,
  });

  factory TeacherModel.fromDocument(DocumentSnapshot doc) => TeacherModel(
        id: doc["id"],
        name: doc["name"],
        sobrenome: doc["sobrenome"],
        universidade: doc["universidade"],
        reference: doc["reference"],
        discMinistradas: doc["discMinistradas"],
        email: doc["email"],
        idClass: doc["idClass"],
        idTurma: doc["idTurma"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sobrenome": sobrenome,
        "universidade": universidade,
        "discMinistradas": discMinistradas,
        "email": email,
        "idClass": idClass,
        "idTurma": idTurma,
        "reference": reference,
      };
}
