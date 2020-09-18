import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/interfaces/cases_repositories__interface.dart';

class CasesRepository extends Disposable implements ICasesRepository {
  final Firestore firestore;

  CollectionReference casesPage;

  CasesRepository({@required this.firestore}) {
    casesPage = Firestore.instance.collection("Cases");
  }
  @override
  void dispose() {}

  @override
  Future<bool> delete(CasesModel model) async {
    try {
      await casesPage.document(model.id).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> update(CasesModel model) async {
    try {
      await casesPage.document(model.id).updateData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Stream<List<CasesModel>> get() {
    try {
      return firestore.collection('Cases').orderBy('position').snapshots().map(
          (query) =>
              query.documents.map((doc) => CasesModel.fromMap(doc)).toList());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> createWidget(ComponentModel model) async {
    try {
      /* model.position = (await casesPage
              .document(model.idCases)
              .collection(model.page)
              .getDocuments())
          .documents
          .length
          .toString(); */

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

  Future<bool> deleteWidget(String casesID, String page, String componentID) async {
    try {
      await casesPage
          .document(casesID)
          .collection(page)
          .document(componentID)
          .delete();
         
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Stream<List<CasesModel>> getForTeacher() {
    var b = firestore
        .collection('Cases')
        /* .where('public', isEqualTo: "true") */
        .orderBy('position')
        .snapshots()
        .map((query) =>
            query.documents.map((doc) => CasesModel.fromMap(doc)).where((element) => element.public == 'true').toList());
    return b;
  }

  Future<bool> updateWidget(ComponentModel model) async {
    try {
      // await casesPage.document(model.id).updateData(model.toMap());
      await casesPage.document(model.idCases).collection(model.page).document(model.id).updateData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createCases(CasesModel model) async {
    try {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      model.teacherID = firebaseUser.uid;
      model.position =
          (await casesPage.getDocuments()).documents.length.toString();

      await casesPage.document(model.id).setData(model.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ComponentModel>> getDocuments(String idCases, String page) async {
    try {
      var collection = await casesPage
          .document(idCases)
          .collection(page)
          .orderBy('position')
          .getDocuments();

      return collection.documents
          .map((item) => ComponentModel.fromMap(item))
          .where((element) => element.idCases == idCases)
          .toList();
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

  Future updateCases(CasesModel model) {
    model.reference.updateData(model.toMap());
  }
}
