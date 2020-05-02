import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';
import 'package:galinha_karoot/app/modules/teacher/repositories/interfaces/teacher_repositories_interfaces.dart';

class TeacherRepository extends Disposable implements ITeacherRepository {
  final Firestore firestore;

  TeacherRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(TeacherModel model) {
    // TODO: implement delete
    return null;
  }

  @override
  Future save(TeacherModel model) {
    // TODO: implement save
    return null;
  }

  @override
  Stream<List<TeacherModel>> getAllStream() {
    return firestore.collection('Teacher').orderBy('position').snapshots().map(
        (query) => query.documents
            .map((doc) => TeacherModel.fromDocument(doc))
            .toList());
  }

  @override
  List<TeacherModel> getAll() {
    // TODO: implement getAll
    return null;
  }

  @override
  Future create(TeacherModel model) async {
    int total = (await Firestore.instance.collection('Teacher').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('Teacher').add({
        'id': model.id,
        'name': model.name,
        'sobrenome': model.sobrenome,
        'universidade': model.universidade,
        'discMinistradas': model.discMinistradas,
        'email': model.email,
        'idClass': model.idClass,
        'idTurma': model.idTurma
      });
    }
  }
}
