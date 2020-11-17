import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
import 'package:galinha_karoot/app/modules/cases/services/cases_service.dart';
import 'package:galinha_karoot/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_page.dart';

class StudentCaseModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesQuizController(
            casesRepository: i.get<CasesRepository>(),
            quizRepository: i.get<QuizRepository>())),
        Bind((i) => StudentCasesPublicController(i.get<CasesRepository>())),
        Bind((i) => StudentCasesHomeController(i.get<Student2Repository>())),
        Bind((i) => CasesRegisterController(i.get<CasesRepository>())),
        Bind((i) => CasesService()),
        Bind((i) => StudentCasesSintomasController(
            student2repository: i.get<Student2Repository>())),
        Bind((i) => StudentCasesQuizController(
            student2repository: i.get<Student2Repository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/cases_home',
            child: (_, args) => StudentCasesHomePage(
                  classModel: args.data,
                )),
        Router('/cases_public', child: (_, args) => StudentCasesPublicPage()),
        Router('/sintomas',
            child: (_, args) => CasesSintomasPage(model: args.data)),
        Router('/quiz',
            child: (_, args) => StudentCasesQuizPage(model: args.data)),
      ];

  static Inject get to => Inject<CasesModule>.of();

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => throw UnimplementedError();
}
