import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  int id;
  String name;
  String sobrenome;
  String universidade;
  String discMinistradas;
  String email;
  DocumentReference reference;
  int idClass;
  int idTurma;
  String role;
  String university;
  String uid;
  
  StudentModel({
    this.id,
    this.name,
    this.sobrenome,
    this.universidade,
    this.discMinistradas,
    this.email,
    this.reference,
    this.idClass,
    this.idTurma,
    this.role,
    this.university,
    this.uid,
  });



  factory StudentModel.fromDocument(DocumentSnapshot doc) => StudentModel(
        id: doc["id"],
        name: doc["name"],
        sobrenome: doc["sobrenome"],
        universidade: doc["universidade"],
        reference: doc.reference,
        discMinistradas: doc["discMinistradas"],
        email: doc["email"],
        idClass: doc["idClass"],
        idTurma: doc["idTurma"],
        role: doc["role"],
        university: doc["university"],
        uid: doc["uid"]
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
        "role": role,
        "university": university,
        "uid": uid
      };
}
