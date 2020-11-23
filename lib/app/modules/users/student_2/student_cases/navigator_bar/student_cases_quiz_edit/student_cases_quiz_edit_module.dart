import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:PeensA/app/modules/cases/models/QuizModel.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_quiz_edit/cases_quiz_edit_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz_edit/student_cases_quiz_edit_page.dart';

class StudentCasesQuizEditModule extends ModuleWidget {
  final QuizModel model;

  StudentCasesQuizEditModule(this.model);
  
  @override
  List<Bind> get binds => [];

  /* @override
  List<Router> get routers => [
    Router('/', child: (_, args) => CasesQuizEditPage())
  ]; */

  static Inject get to => Inject<StudentCasesQuizEditModule>.of();

  @override
  // TODO: implement view
  Widget get view => StudentCasesQuizEditPage(model: model,);
}
