import 'package:cloud_firestore/cloud_firestore.dart';

class QuizModel {
  String casesID;
  String type;
  String question;
  String answers1;
  String answers2;
  String answers3;
  String answers4;
  String answers5;
  String position;
  String right;
  DocumentReference reference;

  QuizModel({
    this.casesID = '',
    this.type = '',
    this.question = '',
    this.answers1 = '',
    this.answers2 = '',
    this.answers3 = '',
    this.answers4 = '',
    this.answers5 = '',
    this.position = '',
    this.right = '',
    this.reference,
  });

  factory QuizModel.fromDocument(DocumentSnapshot doc) => QuizModel(
        casesID: doc["casesID"],
        type: doc['type'],
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
}
