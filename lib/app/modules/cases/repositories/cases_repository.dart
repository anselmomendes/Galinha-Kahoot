import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/interfaces/cases_repositories__interface.dart';

class CasesRepository extends Disposable implements ICasesRepository {
  final Firestore firestore;

  CasesRepository({@required this.firestore});

  CollectionReference cases;
  CollectionReference subCollection;

  @override
  void dispose() {}

  @override
  Future delete(CasesModel model) {
    return model.reference.delete();
  }

  @override
  Future save(CasesModel model) async {
    try {
      if (model.id == null) {
        cases.document(model.id.toString()).setData(model.toMap());
      } else
        cases.document(model.id.toString()).updateData(model.toMap());
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<List<CasesModel>> get() {
    try {
      cases = firestore.collection('Cases');
      return cases.orderBy('position').snapshots().map((query) =>
          query.documents.map((doc) => CasesModel.fromMap(doc.data)).toList());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<List<ComponentModel>> getCasesPage(String idCases, String page) {
    try {
      var list = firestore
          .collection('CasesPage')
          .where('idCases', isEqualTo: idCases)
          .where('page', isEqualTo: page)
          .orderBy('position')
          .snapshots()
          .map((query) => query.documents
              .map((doc) => ComponentModel.fromMap(doc.data))
              .toList());
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> updateWidget(ComponentModel model) async {
    try {
      await firestore
          .collection('CasesPage')
          .document(model.id)
          .updateData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createWidget(ComponentModel model) async {
    try {
      int position =
          (await Firestore.instance.collection('CasesPage').getDocuments())
              .documents
              .length;

      model.position = position.toString();

      await firestore
          .collection('CasesPage')
          .document(model.id)
          .setData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteWidget(ComponentModel model) async {
    try {
      await firestore.collection('CasesPage').document(model.id).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
