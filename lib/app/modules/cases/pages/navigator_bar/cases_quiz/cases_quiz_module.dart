import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';

class CasesQuizModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
    Bind((i) => CasesQuizController(i.get<QuizRepository>())),
  ];

  @override
  List<Router> get routers => [];

  @override
  // TODO: implement view
  Widget get view => CasesQuizPage();

  static Inject get to => Inject<CasesQuizModule>.of();
}
