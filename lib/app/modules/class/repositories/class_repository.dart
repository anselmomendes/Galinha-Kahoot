import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';

class ClassRepository extends Disposable {
  final Firestore firestore;

  ClassRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

    @override
  Future save(ClassModel model) async {
    int total = (await Firestore.instance.collection('Class').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('Class').add({
        'status' : model.status,
        'casesID': model.casesID,
        'teacherID': model.teacherID,
        'creationDate': model.creationDate,
        'modifiedDate': model.modifiedDate,
        'timer': model.timer,
        'right': model.right,
        'position': total
      });
    } else {
      model.reference.updateData({
        'status' : model.status,
        'casesID': model.casesID,
        'teacherID': model.teacherID,
        'creationDate': model.creationDate,
        'modifiedDate': model.modifiedDate,
        'timer': model.timer,
        'right': model.right,
        'position': total
      });
    }
  }

  @override
  Future delete(ClassModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<ClassModel>> get() {
    var a = firestore.collection('Class').orderBy('position').snapshots().map(
        (query) => query.documents
            .map((doc) => ClassModel.fromDocument(doc))
            .toList());
    return a;
  }

/*   Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  } */

}
