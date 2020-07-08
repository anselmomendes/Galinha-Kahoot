import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';

class QuizRepository extends Disposable {
  final Firestore firestore;

  QuizRepository({@required this.firestore});

  @override
  Future save(QuizModel model) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    int total = (await Firestore.instance.collection('Cases').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('Cases').add({
        'casesID': model.casesID,
        'type': model.type,
        'question': model.question,
        'answers1': model.answers1,
        'answers2': model.answers2,
        'answers3': model.answers3,
        'answers4': model.answers4,
        'answers5': model.answers5,
        'right': model.right,
        'position': total
      });
      model.reference.updateData(
          {'id': model.reference.documentID, 'teacherID': firebaseUser.uid});
    } else {
      model.reference.updateData({
        'casesID': model.casesID,
        'type': model.type,
        'question': model.question,
        'answers1': model.answers1,
        'answers2': model.answers2,
        'answers3': model.answers3,
        'answers4': model.answers4,
        'answers5': model.answers5,
        'right': model.right,
        'position': total
      });
    }
  }

  @override
  Future delete(QuizModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<QuizModel>> get() {
    var a = firestore.collection('Quiz').orderBy('position').snapshots().map(
        (query) =>
            query.documents.map((doc) => QuizModel.fromDocument(doc)).toList());
    return a;
  }

  @override
  Stream<List<QuizModel>> getQuiz(String casesID) {
    var a = firestore
        .collection('Quiz')
        .where('casesID', isEqualTo: '$casesID')
        .orderBy('position')
        .snapshots()
        .map((query) =>
            query.documents.map((doc) => QuizModel.fromDocument(doc)).toList());
    return a;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
