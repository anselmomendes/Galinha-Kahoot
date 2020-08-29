import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';

class QuizRepository extends Disposable {
  final Firestore firestore;

  // Variáel p/ a referencia da coleção
  CollectionReference casesPage;

  QuizRepository({@required this.firestore}) {
    // Informando que a coleção atual é 'Cases'
    casesPage = Firestore.instance.collection("Cases");
  }

  @override
  void dispose() {}

  // Cria widget de questões
  Future<bool> createWidget(QuizModel model) async {
    try {
      model.position = (await casesPage
              .document(model.idCases)
              .collection(model.page)
              .getDocuments())
          .documents
          .length
          .toString();

      casesPage
          .document(model.idCases)
          .collection(model.page)
          .document(model.id)
          .setData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Deleta widget de questões
  Future<bool> deleteWidget(String casesID, String page, String questionID) async {
    try {
        await casesPage
          .document(casesID)
          .collection(page).document(questionID).delete();

          // .orderBy('position')
          // .getDocuments()

      // a.documents.last.reference.delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Atualiza valores da questão
  Future<bool> updateWidget(QuizModel model) async {
    try {
      // await casesPage.document(model.id).updateData(model.toMap());
      await casesPage.document(model.idCases).collection(model.page).document(model.id).updateData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Puxa todas as questões do caso
  Future<List<QuizModel>> getDocuments(String idCases, String page) async {
    try {
      var collection = await casesPage
          .document(idCases)
          .collection(page)
          .orderBy('questionNumber')
          // .orderBy('position')
          .getDocuments();

      return collection.documents
          .map((item) => QuizModel.fromMap(item))
          .where((element) => element.idCases == idCases)
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  

  /* @override
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
  Stream<List<QuizModel>> get() {
    var a = firestore.collection('Quiz').orderBy('position').snapshots().map(
        (query) =>
            query.documents.map((doc) => QuizModel.fromDocument(doc)).toList());
    return a;
  }

  @override
  Stream<List<QuizModel>> getQuiz(/* String casesID */) {
    var a = firestore
        .collection('Quiz')
        .where('casesID', isEqualTo: '5Eg2Dv0erU37JCjQYoRI')
        .orderBy('position')
        .snapshots()
        .map((query) =>
            query.documents.map((doc) => QuizModel.fromDocument(doc)).toList());
    return a;
  } */

  //dispose will be called automatically
  
}
