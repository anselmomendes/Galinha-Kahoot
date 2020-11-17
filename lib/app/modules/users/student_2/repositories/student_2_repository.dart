import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:galinha_karoot/app/modules/users/student_2/models/StudentModel.dart';
import 'package:rxdart/rxdart.dart';

// import 'package:dio/native_imp.dart';
enum RegisterClassState { LOADING, SUCESS, FAIL }

class Student2Repository extends Disposable {
  final Firestore firestore = Firestore.instance;
  final Auth auth = Auth();
  FirebaseUser firebaseUser;

  final _stateController = BehaviorSubject<RegisterClassState>();
  final _classesController = BehaviorSubject<List<ClassModel>>();
  final _classController = BehaviorSubject<ClassModel>();
  final _caseController = BehaviorSubject<CasesModel>();
  final _componentsController = BehaviorSubject<List<ComponentModel>>();

  Stream<RegisterClassState> get outState => _stateController.stream;
  Stream<List<ClassModel>> get outClasses => _classesController.stream;
  Stream<ClassModel> get outClass => _classController.stream;
  Stream<CasesModel> get outCase => _caseController.stream;
  Stream<List<ComponentModel>> get outComponents =>
      _componentsController.stream;

  Student2Repository() {
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
  Future<Null> getClasses() async {
    StudentModel student = await getUserInfo();
    List<ClassModel> list = [];
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

  Future<void> getClass(ClassModel classModel) async {
    firestore
        .collection("Class")
        .document(classModel.id)
        .snapshots()
        .listen((turma) {
      ClassModel model = ClassModel.fromDocument(turma);
      _classController.add(model);
    });
  }

  Future<void> getCase(ClassModel classModel) async {
    firestore
        .collection("Cases")
        .document(classModel.casesID)
        .snapshots()
        .listen((casemodel) {
      CasesModel model = CasesModel.fromMap(casemodel);
      _caseController.add(model);
    });
  }

  Future<void> getCaseComponent(String idCases, String page) async {
    List<ComponentModel> list = [];
    try {
      var collection = await Firestore.instance
          .collection("Cases")
          .document(idCases)
          .collection(page)
          .orderBy('position')
          .getDocuments();

      list = collection.documents
          .map((item) => ComponentModel.fromMap(item))
          .where((element) => element.idCases == idCases)
          .toList();
      _componentsController.add(list);
    } catch (e) {
      print("Erro ao chamar os componentes: $e");
      return null;
    }
  }

  //Função que procura a turma pelo codigo
  Future<ClassModel> getClassByAcessCode(
      String accessCode, StudentModel student) async {
    var access = int.parse(accessCode);
    QuerySnapshot doc = await firestore
        .collection('Class')
        .where("accessCode", isEqualTo: access)
        .getDocuments();
    ClassModel model;
    doc.documents.forEach((classs) {
      model = ClassModel.fromDocument(classs);
    });
    print(model);
    addClass(model);
  }

  //Função que adiciona o aluno a turma encontrada
  void addClass(ClassModel classmodel) async {
    StudentModel student = await getUserInfo();
    print("Funfei 3");
    DateTime myDateTime = DateTime.now();
    Timestamp time = Timestamp.fromDate(myDateTime);
    if (await verifyRegisterClass(student, classmodel) == true) {
      await firestore
          .collection("Class")
          .document(classmodel.id)
          .collection("students")
          .document(student.uid)
          .setData(
              {'name': student.name, 'id': student.uid, 'registerDate': time});
      addClassForStudent(classmodel);
      _stateController.add(RegisterClassState.SUCESS);
    } else {
      _stateController.add(RegisterClassState.FAIL);
    }
  }

  void addClassForStudent(ClassModel classmodel) async {
    StudentModel student = await getUserInfo();
    DateTime myDateTime = DateTime.now();
    Timestamp time = Timestamp.fromDate(myDateTime);
    await firestore
        .collection("users")
        .document(student.uid)
        .collection("classes")
        .document(classmodel.id)
        .setData({
      'className': classmodel.className,
      'id': classmodel.id,
      'registerDate': time
    });
  }

  //Função que verifica se o aluno já estava na turma
  Future<bool> verifyRegisterClass(
      StudentModel student, ClassModel classmodel) async {
    return await firestore
        .collection("Class")
        .document(classmodel.id)
        .collection("students")
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

  getAllStream() {}
}
