import 'package:cloud_firestore/cloud_firestore.dart';
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
    int total = (await Firestore.instance.collection('Cases').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('Cases').add({
        'idCases': model.idCases,
        'title': model.title,
        'description': model.description,
        'imageUrl': model.imageUrl,
        'position': total
      });
      //print("ID da case: ${model.reference.documentID}");
      model.reference.updateData({'id': model.reference.documentID});
    } else {
      model.reference.updateData({
        'idCases': model.idCases,
        'title': model.title,
        'description': model.description,
        'imageUrl': model.imageUrl,
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
