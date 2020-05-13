import 'package:cloud_firestore/cloud_firestore.dart';

class ClassModel {
  String id;
  int accessCode;
  bool status;
  String casesID;
  String teacherID;
  String creationDate;
  String modifiedDate;
  String endTime;
  String timer;
  int position;
  String right;
  DocumentReference reference;

  ClassModel({
    this.id,
    this.accessCode,
    this.status = true,
    this.casesID = '',
    this.creationDate = '',
    this.modifiedDate = '',
    this.endTime,
    this.timer,
    this.position,
    this.right = '',
    this.reference,
  });

  factory ClassModel.fromDocument(DocumentSnapshot doc) => ClassModel(
        id: doc["id"],
        accessCode: doc["accessCode"],
        status: doc["status"],
        casesID: doc["casesID"],
        creationDate: doc["creationDate"],
        modifiedDate: doc["modifiedDate"],
        endTime: doc["endTime"],
        timer: doc["timer"],
        position: doc["position"],
        right: doc["right"],
        reference: doc.reference,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accessoCode": accessCode,
        "status": status,
        "casesID": casesID,
        "creationDate": creationDate,
        "modifiedDate": modifiedDate,
        "endTime": endTime,
        "timer": timer,
        "position": position,
        "right": right,
      };
}