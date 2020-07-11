import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_public/cases_public_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_public/cases_public_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pages/cases_home/cases_home_controller.dart';
import 'pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'repositories/quiz_repository.dart';
import 'pages/cases_single/cases_single_controller.dart';
import 'pages/navigator_bar/cases_sintomas/cases_sintomas_page.dart';
import 'store/cases_store.dart';
import 'pages/cases_home/cases_home_page.dart';
import 'pages/cases_register/cases_register_controller.dart';
import 'pages/cases_register/cases_register_page.dart';
import 'pages/cases_single/cases_single_page.dart';
import 'services/cases_service.dart';
import 'repositories/cases_repository.dart';
//>>>>>>> 9092e352c56c881e239a5f9240003e32bf7c89e5
import 'package:flutter_modular/flutter_modular.dart';
import 'view_model/cases_viewmodel.dart';
import 'store/cases_store.dart';
import 'pages/cases_edit/cases_edit_controller.dart';
import 'pages/cases_edit/cases_edit_page.dart';
import 'pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';

class CasesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesPublicController(i.get<CasesRepository>())),
        // Bind((i) => CasesQuizController()),
        // Bind((i) => CasesQuizController()),
        // Bind((i) => QuizRepository()),
        Bind((i) => CasesSintomasController(casesRepository: i.get<CasesRepository>())),
        Bind((i) => CasesHomeController(i.get<CasesViewModel>())),
        Bind((i) => CasesRegisterController(i.get<CasesRepository>())),
        Bind((i) => CasesService()),
        Bind((i) => CasesSingleController(i.get<CasesStore>())),
        Bind((i) => CasesEditController(i.get<CasesRepository>())),
        Bind((i) => QuizRepository(firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('/cases_home',
            child: (_, args) => CasesHomePage(model: args.data)),
        Router('/sintomas',
            child: (_, args) => CasesSintomasPage(model: args.data)),
        Router('/cases_register', child: (_, args) => CasesRegisterPage()),
        Router('/cases_single', child: (_, args) => CasesSinglePage()),
        Router('/cases_edit',
            child: (_, args) => CasesEditPage(model: args.data)),
        Router('/cases_public', child: (_, args) => CasesPublicPage()),
      ];

  static Inject get to => Inject<CasesModule>.of();
}
