import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_page.dart';

class StudentCasesQuizModule extends ModuleWidget {
  String title;
  String page;
  final CasesModel model;

  StudentCasesQuizModule({this.model, this.title, this.page});

  @override
  List<Bind> get binds => [
        // Bind((i) => CasesQuizController(i.get<QuizRepository>(),i.get<CasesRepository>())),
      ];

  static Inject get to => Inject<StudentCasesQuizModule>.of();

  @override
  // TODO: implement view
  Widget get view => StudentCasesQuizPage(
        title: title,
        page: page,
        model: model,
      );
}
