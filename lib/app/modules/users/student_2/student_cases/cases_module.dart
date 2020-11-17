import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/ImageRepository.dart';

import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
import 'package:galinha_karoot/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_edit/student_cases_edit_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz_edit/student_cases_quiz_edit_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_config/student_cases_config_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_config/student_cases_config_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_home/student_cases_home_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_register/student_cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_register/student_cases_register_page.dart';
import 'navigator_bar/student_cases_edit/student_cases_edit_page.dart';
import 'navigator_bar/student_cases_quiz_edit/student_cases_quiz_edit_page.dart';
import 'navigator_bar/student_cases_sintomas/student_cases_sintomas_page.dart';



class StudentCasesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentCasesQuizEditController(i.get<QuizRepository>())),
        Bind((i) => StudentCasesConfigController(i.get<CasesRepository>())),
        Bind((i) =>
            StudentCasesSintomasController(casesRepository: i.get<CasesRepository>())),
        Bind((i) => CasesQuizController(
            casesRepository: i.get<CasesRepository>(),
            quizRepository: i.get<QuizRepository>())),
        Bind((i) => StudentCasesPublicController(i.get<CasesRepository>())),
        Bind((i) => StudentCasesHomeController(i.get<CasesViewModel>())),
        Bind((i) => StudentCasesRegisterController(i.get<CasesRepository>())),
        Bind((i) => StudentCasesService()),
                Bind((i) => StudentCasesEditController(
                  casesRepository: i.get<CasesRepository>(),
                 )),
                Bind((i) => QuizRepository(firestore: Firestore.instance)),
              ];
        
          @override
          List<Router> get routers => [
                Router('/student_cases_home',
                    child: (_, args) => StudentCasesHomePage(model: args.data)),
                Router('/sintomas',
                    child: (_, args) => StudentCasesSintomasPage(model: args.data)),
                Router('/cases_register',
                    child: (_, args) => StudentCasesRegisterPage(/*model: args.data*/)),
                Router('/cases_edit',
                    child: (_, args) => StudentCasesEditPage(model: args.data)),
                Router('/student_cases_public', child: (_, args) => StudentCasesPublicPage()),
                Router('/student_cases_config',
                    child: (_, args) => StudentCasesConfigPage(model: args.data)),
                Router('/cases_quiz_edit',
                    child: (_, args) => StudentCasesQuizEditPage(model: args.data)),
              ];
        
          static Inject get to => Inject<StudentCasesModule>.of();
        }
        
        class StudentCasesService {
}
