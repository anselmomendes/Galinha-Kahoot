import 'package:cloud_firestore/cloud_firestore.dart';

class CasesModel {
  int id;
  String question;
  String answers1;
  String answers2;
  String answers3;
  String answers4;
  String answers5;
  int position;
  String right;
  DocumentReference reference;

  CasesModel({
    this.id,
    this.question = '',
    this.answers1 = '',
    this.answers2 = '',
    this.answers3 = '',
    this.answers4 = '',
    this.answers5 = '',
    this.position,
    this.right = '',
    this.reference,
  });

  factory CasesModel.fromDocument(DocumentSnapshot doc) => CasesModel(
        id: doc["id"],
        question: doc["question"],
        answers1: doc["answers1"],
        answers2: doc["answers2"],
        answers3: doc["answers3"],
        answers4: doc["answers4"],
        answers5: doc["answers5"],
        position: doc["position"],
        right: doc["right"],
        reference: doc.reference,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers1": answers1,
        "answers2": answers2,
        "answers3": answers3,
        "answers4": answers4,
        "answers5": answers5,
        "position": position,
        "right": right,
      };
}
