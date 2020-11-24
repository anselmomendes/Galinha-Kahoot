import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/QuizModel.dart';
import 'package:PeensA/app/modules/users/student_2/models/StudentModel.dart';
import 'package:rxdart/rxdart.dart';

class ReportRepository extends Disposable {
  final _studentsController = BehaviorSubject<List<StudentModel>>();
  final _quizConttoller = BehaviorSubject<List<QuizModel>>();

  Stream<List<StudentModel>> get ouStudents => _studentsController.stream;
  Stream<List<QuizModel>> get outQuiz => _quizConttoller.stream;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  void getStudentsList(String idCase) async {
    String idClass = await getIDClass(idCase);
    List<StudentModel> list;
    Firestore.instance
        .collection("Class")
        .document(idClass)
        .collection("students")
        .snapshots()
        .listen((students) {
      students.documents.forEach((student) {
        list.add(StudentModel.fromDocument(student));
      });
      _studentsController.add(list);
    });
  }

  Future<void> getStudentsWhoAnswered(String idCase) async {
    List<StudentModel> list = [];
    Firestore.instance
        .collection("Cases")
        .document(idCase)
        .collection("report")
        .snapshots()
        .listen((students) {
      students.documents.forEach((student) {
        list.add(StudentModel.fromDocument(student));
      });
      _studentsController.add(list);
    });
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

  Future getQuiz(String casesID) async {
    List<QuizModel> list = [];
    try {
      var collection = await Firestore.instance
          .collection("Cases")
          .document(casesID)
          .collection("quiz")
          .orderBy('position')
          .getDocuments();

      list = collection.documents
          .map((item) => QuizModel.fromMap(item))
          .where((element) => element.idCases == casesID)
          .toList();
      print("Foram encontrados ${list.length} quizes");
      _quizConttoller.add(list);
    } catch (e) {
      print("Erro ao chamar os componentes: $e");
      return null;
    }
  }
}
