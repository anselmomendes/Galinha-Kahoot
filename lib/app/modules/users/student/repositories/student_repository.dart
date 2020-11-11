import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:galinha_karoot/app/modules/users/student/model/student_model.dart';
import 'package:rxdart/rxdart.dart';

enum RegisterClassState { LOADING, SUCESS, FAIL }

class StudentRepository extends Disposable {
  final Firestore firestore = Firestore.instance;
  final Auth auth = Auth();
  FirebaseUser firebaseUser;

  final _stateController = BehaviorSubject<RegisterClassState>();
  final _classesController = BehaviorSubject<List<ClassModel>>();

  Stream<RegisterClassState> get outState => _stateController.stream;
  Stream<List<ClassModel>> get outClasses => _classesController.stream;

  StudentRepository() {
    print("Student Repo started!");
  }

  Future<StudentModel> getUserInfo() async {
    firebaseUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot doc =
        await firestore.collection("users").document(firebaseUser.uid).get();
    return StudentModel.fromDocument(doc);
  }

  /**
   * Função que lista as turmas que o aluno esta inserido,
   */
  Future<Stream<List<ClassModel>>> getClasses(StudentModel student) async {
    List<ClassModel> list;
    firestore
        .collection("users")
        .document(student.uid)
        .collection("classes")
        .snapshots()
        .listen((classes) {
      classes.documents.forEach((turma) {
        list.add(ClassModel.fromDocument(turma));
      });
      _classesController.add(list);
    });
  }

  //Função que procura a turma pelo codigo
  Future<ClassModel> getClassByAcessCode(
      String accessCode, StudentModel student) async {
    DocumentSnapshot doc = (await firestore
        .collection('Class')
        .where("accessCode", isEqualTo: accessCode)
        .getDocuments()) as DocumentSnapshot;
    ClassModel model = ClassModel.fromDocument(doc);
    addClass(model, student);
  }

  //Função que adiciona o aluno a turma encontrada
  void addClass(ClassModel classmodel, StudentModel student) async {
    if (await verifyRegisterClass(student)) {
      await firestore
          .collection("Class")
          .document(classmodel.id)
          .collection("students")
          .document(student.uid)
          .setData({'name': student.name, 'id': student.uid});
      _stateController.add(RegisterClassState.SUCESS);
    } else {
      _stateController.add(RegisterClassState.FAIL);
    }
  }

  //Função que verifica se o aluno já estava na turma
  Future<bool> verifyRegisterClass(StudentModel student) async {
    return await firestore
        .collection("Class")
        .document(student.uid)
        .get()
        .then((doc) {
      if (doc.data == null) {
        return true;
      } else {
        return false;
      }
    });
  }

  @override
  void dispose() {
    _stateController.close();
  }
}
