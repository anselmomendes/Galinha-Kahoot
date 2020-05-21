import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuestionModel.dart';

import 'interfaces/question_repositories_interface.dart';

class QuestionRepository extends Disposable implements IQuestionRepository {
  final Firestore firestore;

  QuestionRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(QuestionModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<QuestionModel>> get() {
    var a = firestore
        .collection('Question')
        .orderBy('position')
        .snapshots()
        .map((query) => query.documents
            .map((doc) => QuestionModel.fromDocument(doc))
            .toList());
    return a;
  }

  @override
  Future save(QuestionModel model) async {
    int total = (await Firestore.instance.collection('Question').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('Question').add({
        'question': model.question,
        'answers1': model.answers1,
        'answers2': model.answers2,
        'answers3': model.answers3,
        'answers4': model.answers4,
        'answers5': model.answers5,
        'right': model.right,
        'position': total
      });
    } else {
      model.reference.updateData({
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
}
