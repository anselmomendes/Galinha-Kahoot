import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class QuizModel {
  String id;
  String idCases;
  String position;
  String type;
  String page;
  String question;
  String answers1;
  String answers2;
  String answers3;
  String answers4;
  String answers5;
  String right;
  int time;
  String commentary;
  String questionNumber;
  DocumentReference reference;

  QuizModel({
    this.id,
    this.idCases,
    this.position,
    this.type,
    this.page,
    this.question,
    this.answers1,
    this.answers2,
    this.answers3,
    this.answers4,
    this.answers5,
    this.right,
    this.time,
    this.commentary,
    this.questionNumber,
    this.reference,
  }) {
    id = id ?? Uuid().v1();
  }

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map['id'] = id;
    map['idCases'] = idCases;
    map['position'] = position;
    map['type'] = type;
    map['page'] = page;
    map['question'] = question;
    map['answers1'] = answers1;
    map['answers2'] = answers2;
    map['answers3'] = answers3;
    map['answers4'] = answers4;
    map['answers5'] = answers5;
    map['right'] = right;
    map['time'] = time;
    map['commentary'] = commentary;
    map['questionNumber'] = questionNumber;
    return map;
  }

  factory QuizModel.fromMap(DocumentSnapshot map) => QuizModel(
      id: map['id'],
      idCases: map['idCases'],
      position: map['position'],
      type: map['type'],
      page: map['page'],
      question: map['question'],
      answers1: map['answers1'],
      answers2: map['answers2'],
      answers3: map['answers3'],
      answers4: map['answers4'],
      answers5: map['answers5'],
      right: map['right'],
      time: map["time"],
      commentary: map["commentary"],
      questionNumber: map["questionNumber"],
      reference: map.reference);
}
