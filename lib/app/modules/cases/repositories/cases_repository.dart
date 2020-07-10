import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/interfaces/cases_repositories__interface.dart';

class CasesRepository extends Disposable implements ICasesRepository {
  final Firestore firestore;

  CollectionReference apresentacao;

  CasesRepository({@required this.firestore}) {
    apresentacao = Firestore.instance.collection("apresentacao");
  }

  @override
  void dispose() {}

  @override
  Future delete(CasesModel model) {
    return model.reference.delete();
  }

/*
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
*/
  @override
  Stream<List<CasesModel>> get() {
    try {
      return firestore.collection('Cases').orderBy('position').snapshots().map(
          (query) => query.documents
              .map((doc) => CasesModel.fromMap(doc.data))
              .toList());
    } catch (e) {
      print(e);
      return null;
    }
  }

/*
Stream<List<ComponentModel>> getApresentacao(String idCases) {
    try {
      var list = firestore
          .collection('apresentacao')
          .orderBy('position')
          .snapshots()
          .map((query) => query.documents
              .map((doc) => ComponentModel.fromMap(doc))
              .toList());
      return list;
    } catch (e) {
      print(e);
      return null;
    }
}
*/
  Stream<List<ComponentModel>> getAvaliacao(String idCases) {
    try {
      var list = firestore.collection('avaliacao');
      return list
          //.where('idCases', isEqualTo: idCases)
          //.where('page', isEqualTo: page)
          .orderBy('position')
          .snapshots()
          .map((query) => query.documents
              .map((doc) => ComponentModel.fromMap(doc))
              .toList());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<List<ComponentModel>> getInformacao(String idCases) {
    try {
      var list = firestore.collection('informacao');
      return list
          //.where('idCases', isEqualTo: idCases)
          //.where('page', isEqualTo: page)
          .orderBy('position')
          .snapshots()
          .map((query) => query.documents
              .map((doc) => ComponentModel.fromMap(doc))
              .toList());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<List<ComponentModel>> getExames(String idCases) {
    try {
      var list = firestore.collection('Exames');
      return list
          //.where('idCases', isEqualTo: idCases)
          //.where('page', isEqualTo: page)
          .orderBy('position')
          .snapshots()
          .map((query) => query.documents
              .map((doc) => ComponentModel.fromMap(doc))
              .toList());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> updateWidget(ComponentModel model) async {
    try {
      await firestore
          .collection('apresentacao')
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
      model.position =
          (await Firestore.instance.collection('apresentacao').getDocuments())
              .documents
              .length
              .toString();

      await firestore
          .collection('apresentacao')
          .document(model.id)
          .setData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future deleteWidget() async {
    try {
      QuerySnapshot a = (await Firestore.instance
          .collection('apresentacao')
          .orderBy('position')
          .getDocuments());

      a.documents[a.documents.length - 1].reference.delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List<ComponentModel>> getDocuments(String idCases) async {
    try {
      var page = await apresentacao.orderBy('position').getDocuments();

      var aux =
          page.documents.map((item) => ComponentModel.fromMap(item)).toList();
      var aux2 = aux.where((element) => element.idCases == idCases).toList();
      return aux2;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future save(CasesModel model) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
