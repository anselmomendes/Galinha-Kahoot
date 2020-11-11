import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';

class StudentQuizRepository extends Disposable {
  final db = Firestore.instance;
  @override
  void dispose() {}

  Future<QuizModel> getQuiz(String idCases, String idQuiz) async {
    try {
      DocumentSnapshot document = await db
          .collection("Cases")
          .document(idCases)
          .collection("quiz")
          .document(idQuiz)
          .get();

      return QuizModel.fromMap(document);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
