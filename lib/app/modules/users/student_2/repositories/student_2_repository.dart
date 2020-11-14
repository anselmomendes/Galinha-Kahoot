import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student_2/models/StudentModel.dart';
// import 'package:dio/native_imp.dart';

class Student2Repository extends Disposable {
  final Firestore firestore;
  
  Student2Repository({
    @required this.firestore,
  });

  // TeacherRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(StudentModel model) {
    // TODO: implement delete
    return model.reference.delete();
  }

  @override
  Future save(StudentModel model) {
    // TODO: implement save
    model.reference.updateData({
      "name": model.name,
      "university": model.university,
    });
  }

  // Buscar user professor
  @override
  Future<StudentModel> getAllStream() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();

    /* var a = await firestore
        .collection('users')
        .document(firebaseUser.uid)
        .get()
        .then((value) {
      print(value.data);
    });
    return a; */
    var a = await firestore
        .collection('users')
        .document(firebaseUser.uid)
        .get()
        .then((value) => StudentModel.fromDocument(value));
    return a;
  }

/*   @override
  Future<Stream<List<TeacherModel>>> get getAllStream  async {
    // return firestore.collection('Teacher').orderBy('position').snapshots().map(
    //     (query) => query.documents
    //         .map((doc) => TeacherModel.fromDocument(doc))
    //         .toList());
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    var a = firestore
        .collection('users')
        .document(firebaseUser.uid)
        .get()
        .then((value) {
      print(value.data);
    });
    return a;
  } */

  @override
  List<StudentModel> getAll() {
    // TODO: implement getAll
    return null;
  }

  @override
  void getData() {
    firestore.collection("user").getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  @override
  Future create(StudentModel model) async {
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

  /* //dispose will be called automatically
  @override
  void dispose() {} */
}
