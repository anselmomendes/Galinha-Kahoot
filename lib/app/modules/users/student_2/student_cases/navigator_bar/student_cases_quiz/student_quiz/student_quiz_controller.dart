import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:math';

part 'student_quiz_controller.g.dart';

class StudentQuizController = _StudentQuizControllerBase
    with _$StudentQuizController;

abstract class _StudentQuizControllerBase with Store {
  @observable
  List<QuizModel> _listquiz;

  Random _random = new Random();
  int questionIndex = 0;
  bool _shiftAnswer;
  int hitNumber = 0;
  String answer;

  Map answers;

  int get questionsNumber => _listquiz?.length ?? 0;
  QuizModel get question => _listquiz[questionIndex];

  getQuiz(List<QuizModel> model) {
    _listquiz = model;
  }

  void nextQuestion() {
    questionIndex = ++questionIndex % _listquiz.length;
  }

  String getType() {
    return _listquiz[questionIndex].type;
  }

  String getQuestion() {
    return _listquiz[questionIndex].question;
  }

  String getanswers1() {
    return _listquiz[questionIndex].answers1;
  }

  String getanswers2() {
    return _listquiz[questionIndex].answers2;
  }

  String getanswers3() {
    return _listquiz[questionIndex].answers3;
  }

  String getanswers4() {
    return _listquiz[questionIndex].answers4;
  }

  String getanswers5() {
    return _listquiz[questionIndex].answers5;
  }

  bool correctAnswer(String answer) {
    var correct = _listquiz[questionIndex].right == answer;
    hitNumber = hitNumber + (correct ? 1 : 0);
    answers[_listquiz[questionIndex].id] = answer;
    return correct;
  }
}
