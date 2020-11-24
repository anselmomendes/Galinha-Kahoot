import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PeensA/app/modules/users/student_2/models/StudentModel.dart';

class ClassModel {
  String id = '';
  String className = '';
  int accessCode = 0;
  bool status = true;
  String casesID = '';
  String titleCase = '';
  String teacherID = '';
  Timestamp creationDate;
  Timestamp modifiedDate;
  Timestamp endTime;
  int timer;
  int position;
  DocumentReference reference;
  List<StudentModel> listStudents;

  ClassModel(
      {this.id = '',
      this.className = '',
      this.accessCode,
      this.status = true,
      this.casesID = '',
      this.titleCase = '',
      this.creationDate,
      this.modifiedDate,
      this.endTime,
      this.timer,
      this.position,
      this.teacherID = '',
      this.reference,
      this.listStudents});

  factory ClassModel.fromDocument(DocumentSnapshot doc) => ClassModel(
      id: doc["id"],
      className: doc["className"],
      accessCode: doc["accessCode"],
      status: doc["status"],
      casesID: doc["casesID"],
      titleCase: doc["titleCase"],
      creationDate: doc["creationDate"],
      modifiedDate: doc["modifiedDate"],
      endTime: doc["endTime"],
      timer: doc["timer"],
      position: doc["position"],
      teacherID: doc["teacherID"],
      reference: doc.reference,
      listStudents: doc['listStudents']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "className": className,
        "accessoCode": accessCode,
        "status": status,
        "casesID": casesID,
        "titleCase": titleCase,
        "creationDate": creationDate,
        "modifiedDate": modifiedDate,
        "endTime": endTime,
        "timer": timer,
        "position": position,
        "teacherID": teacherID,
        "listStudents": listStudents
      };
}
