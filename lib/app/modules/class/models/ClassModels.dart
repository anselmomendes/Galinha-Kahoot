import 'package:cloud_firestore/cloud_firestore.dart';

class ClassModel {
  String id;
  bool status;
  String casesID;
  String teacherID;
  String creationDate;
  String modifiedDate;
  int timer;
  int position;
  String right;
  DocumentReference reference;

  ClassModel({
    this.id,
    this.status = true,
    this.casesID = '',
    this.creationDate = '',
    this.modifiedDate = '',
    this.timer,
    this.position,
    this.right = '',
    this.reference,
  });

  factory ClassModel.fromDocument(DocumentSnapshot doc) => ClassModel(
        id: doc["id"],
        status: doc["status"],
        casesID: doc["casesID"],
        creationDate: doc["creationDate"],
        modifiedDate: doc["modifiedDate"],
        timer: doc["timer"],
        position: doc["position"],
        right: doc["right"],
        reference: doc.reference,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "casesID": casesID,
        "creationDate": creationDate,
        "modifiedDate": modifiedDate,
        "timer": timer,
        "position": position,
        "right": right,
      };
}