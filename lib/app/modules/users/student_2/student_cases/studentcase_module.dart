import 'package:PeensA/app/modules/users/student_2/student_cases/cases_list/cases_list_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/cases_list/cases_list_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_public/student_quiz_public/student_quiz_public_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_public/student_quiz_public/student_quiz_public_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/cases_module.dart';
import 'package:PeensA/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_page.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/cases/repositories/quiz_repository.dart';
import 'package:PeensA/app/modules/cases/services/cases_service.dart';
import 'package:PeensA/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_cases_quiz_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_page.dart';

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
        Bind((i) => StudentCasesRelatorioController(
            student2Repository: i.get<Student2Repository>())),
        Bind((i) => StudentQuizPublicController()),
        Bind((i) => CasesListController()),
      ];

  @override
  List<Router> get routers => [
        Router('/cases_home',
            child: (_, args) => StudentCasesHomePage(
                  casesModel: args.data,
                )),
        Router('/cases_list',
            child: (_, args) => CasesListPage(
                  classModel: args.data,
                )),
        Router('/cases_public', child: (_, args) => StudentCasesPublicPage()),
        Router('/sintomas',
            child: (_, args) => CasesSintomasPage(model: args.data)),
        Router('/quiz',
            child: (_, args) => StudentCasesQuizPage(model: args.data)),
        Router('/cases_relatory',
            child: (_, args) => StudentCasesRelatorioPage(model: args.data)),
        Router('/student_quiz_public',
            // ignore: missing_required_param
            child: (_, args) => StudentQuizPublicPage(list: args.data)),
      ];

  static Inject get to => Inject<CasesModule>.of();

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => throw UnimplementedError();
}
