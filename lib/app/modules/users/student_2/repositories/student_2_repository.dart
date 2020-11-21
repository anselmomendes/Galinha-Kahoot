import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
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

  //Controllers que armazenam o fluxo de dados
  final _stateController = BehaviorSubject<RegisterClassState>();
  final _classesController = BehaviorSubject<List<ClassModel>>();
  final _classController = BehaviorSubject<ClassModel>();
  final _caseController = BehaviorSubject<CasesModel>();
  final _componentsController = BehaviorSubject<List<ComponentModel>>();
  final _quizConttoller = BehaviorSubject<List<QuizModel>>();
  final _accessquizConttoller = BehaviorSubject<bool>();

  //Funções que carregam os dados das Streams
  Stream<RegisterClassState> get outState => _stateController.stream;
  Stream<List<ClassModel>> get outClasses => _classesController.stream;
  Stream<ClassModel> get outClass => _classController.stream;
  Stream<CasesModel> get outCase => _caseController.stream;
  Stream<List<ComponentModel>> get outComponents =>
      _componentsController.stream;
  Stream<List<QuizModel>> get outQuiz => _quizConttoller.stream;
  Stream<bool> get outAccessQuiz => _accessquizConttoller.stream;

  Student2Repository() {
    print("Student Repo started!");
  }

  //Carrega os dados do usuario
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

  /**
   * Função que carrega a Turma, ela recebe a turma 
   * fica armazenada no repositorio do aluno(essa turma possui menos dados,
   *  por isso e necessario carregar a original)
   */
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

  //Função que carrega o caso
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

  //Função que carrega os componentes do Caso, ex: os textos e imagens.
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

  //Função para carregar o quiz
  Future<void> getQuiz(String idCases, String page) async {
    List<QuizModel> list = [];
    try {
      var collection = await Firestore.instance
          .collection("Cases")
          .document(idCases)
          .collection(page)
          .orderBy('position')
          .getDocuments();

      list = collection.documents
          .map((item) => QuizModel.fromMap(item))
          .where((element) => element.idCases == idCases)
          .toList();
      print("Foram encontrados ${list.length} quizes");
      _quizConttoller.add(list);
    } catch (e) {
      print("Erro ao chamar os componentes: $e");
      return null;
    }
  }

  //Função para armazenar o Quiz respondido dentro do repositorio do aluno
  Future saveQuizAnswered(List<QuizModel> quiz, int hitNumber) async {
    StudentModel student = await getUserInfo();
    String idClass = await getIDClass(quiz[0].idCases);
    quiz.forEach((question) async {
      await Firestore.instance
          .collection("users")
          .document('${student.uid}')
          .collection('classes')
          .document(idClass)
          .collection("cases")
          .document(quiz[0].idCases)
          .collection("quiz")
          .document(question.id)
          .setData(question.toMap())
          .whenComplete(() => print("Questão foi salva"));
      await Firestore.instance
          .collection("users")
          .document('${student.uid}')
          .collection('classes')
          .document(idClass)
          .collection("cases")
          .document(quiz[0].idCases)
          .setData({'hits': hitNumber, 'access': 'disable'});
    });
  }

  //Verifica se o aluno pode fazer o quiz
  Future<void> verifyAccessQuizReport(String idCases) async {
    StudentModel student = await getUserInfo();
    String idClass = await getIDClass(idCases);
    bool access = true;
    try {
      DocumentSnapshot doc = await Firestore.instance
          .collection("users")
          .document('${student.uid}')
          .collection('classes')
          .document(idClass)
          .collection("cases")
          .document(idCases)
          .get();
      doc.data.forEach((key, value) {
        if (value == "disable") {
          access = false;
          _accessquizConttoller.add(access);
        }
      });
    } catch (e) {
      _accessquizConttoller.add(access);
    }
  }

//Verifica se o aluno pode fazer o quiz
  Future<bool> verifyAccessQuiz(List<QuizModel> quiz) async {
    StudentModel student = await getUserInfo();
    String idClass = await getIDClass(quiz[0].idCases);
    bool access = true;
    try {
      DocumentSnapshot doc = await Firestore.instance
          .collection("users")
          .document('${student.uid}')
          .collection('classes')
          .document(idClass)
          .collection("cases")
          .document(quiz[0].idCases)
          .get();
      doc.data.forEach((key, value) {
        if (value == "disable") {
          access = false;
        }
      });
    } catch (e) {
      return access;
    }

    return access;
  }

  //Função de apoio da setQuizAnswered(), serve para procurar o ID da turma que o quiz esta inserido
  Future<String> getIDClass(String casesID) async {
    String classID;
    QuerySnapshot doc = await Firestore.instance
        .collection("Class")
        .where("casesID", isEqualTo: casesID)
        .getDocuments();
    doc.documents.forEach((classe) {
      classID = classe.documentID;
    });
    print("Id da turma: $classID");
    return classID;
  }

  //Função que procura a turma pelo codigo
  Future<void> getClassByAcessCode(
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

  //Função que adiciona a turma dentro do repositorio do aluno
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

  Future<List<QuizModel>> getQuizAnswer(String idCases) async {
    StudentModel student = await getUserInfo();
    String idClass = await getIDClass(idCases);
    try {
      var collection = await Firestore.instance
          .collection("users")
          .document(student.uid)
          .collection("classes")
          .document(idClass)
          .collection("cases")
          .document(idCases)
          .collection("quiz")
          .orderBy('questionNumber')
          .getDocuments();
      return collection.documents
          .map((item) => QuizModel.fromMap(item))
          .where((element) => element.idCases == idCases)
          .toList();
    } catch (e) {
      print("Erro ao chamar os componentes: $e");
      return null;
    }
  }

  Future<String> getHits(String idCases) async {
    StudentModel student = await getUserInfo();
    String idClass = await getIDClass(idCases);
    String hits;
    try {
      var collection = await Firestore.instance
          .collection("users")
          .document(student.uid)
          .collection("classes")
          .document(idClass)
          .collection("cases")
          .document(idCases)
          .get();
      collection.data.forEach((key, value) {
        if (key == 'hits') {
          hits = '$value';
        }
      });
      return hits;
    } catch (e) {
      print("Não foi possivel carregar acertos: $e");
    }
  }

  @override
  void dispose() {
    _stateController.close();
  }

  getAllStream() {}
}
