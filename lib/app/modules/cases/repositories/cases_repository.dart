import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/interfaces/cases_repositories__interface.dart';

class CasesRepository extends Disposable implements ICasesRepository {
  final Firestore firestore;

  CasesRepository({@required this.firestore});

  @override
  void dispose() {}

  @override
  Future save(CasesModel model) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    int total = (await Firestore.instance.collection('Cases').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('Cases').add({
        'title': model.title,
        'description': model.description,
        'topicOne': model.topicOne,
        'textOne': model.textOne,
        'imageUrlOne': model.imageUrlOne,
        'topicTwo': model.topicTwo,
        'textTwo': model.textTwo,
        'imageUrlTwo': model.imageUrlTwo,
        'topicTree': model.topicTree,
        'textTree': model.textTree,
        'imageUrlTree': model.imageUrlTree,
        'topicFour': model.topicFour,
        'textFour': model.textFour,
        'imageUrlFour': model.imageUrlFour,
        'topicFive': model.topicFive,
        'textFive': model.textFive,
        'imageUrlFive': model.imageUrlFive,
        'topicSix': model.topicSix,
        'textSix': model.textSix,
        'imageUrlSix': model.imageUrlSix,
        'position': total
      });
      //print("ID da case: ${model.reference.documentID}");
      model.reference.updateData({
        'id': model.reference.documentID,
        'teacherID': firebaseUser.uid
        });
    } else {
      model.reference.updateData({
        'title': model.title,
        'description': model.description,
        'topicOne': model.topicOne,
        'textOne': model.textOne,
        'imageUrlOne': model.imageUrlOne,
        'topicTwo': model.topicTwo,
        'textTwo': model.textTwo,
        'imageUrlTwo': model.imageUrlTwo,
        'topicTree': model.topicTree,
        'textTree': model.textTree,
        'imageUrlTree': model.imageUrlTree,
        'topicFour': model.topicFour,
        'textFour': model.textFour,
        'imageUrlFour': model.imageUrlFour,
        'topicFive': model.topicFive,
        'textFive': model.textFive,
        'imageUrlFive': model.imageUrlFive,
        'topicSix': model.topicSix,
        'textSix': model.textSix,
        'imageUrlSix': model.imageUrlSix,
        'position': total
      });
    }
  }

  @override
  Future delete(CasesModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<CasesModel>> get() {
    var a = firestore.collection('Cases').orderBy('position').snapshots().map(
        (query) => query.documents
            .map((doc) => CasesModel.fromDocument(doc))
            .toList());
    return a;
  }
}
