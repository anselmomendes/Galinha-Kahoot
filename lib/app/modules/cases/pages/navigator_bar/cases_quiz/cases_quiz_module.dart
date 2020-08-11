import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_module.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';

class CasesQuizModule extends ModuleWidget {
  String title;
  String page;
  final CasesModel model;

  CasesQuizModule({this.model, this.title, this.page});
  
  @override
  List<Bind> get binds => [
    // Bind((i) => CasesQuizController(i.get<QuizRepository>(),i.get<CasesRepository>())),
  ];

  /* @override
  List<Router> get routers => []; */

  static Inject get to => Inject<CasesQuizModule>.of();

  @override
  // TODO: implement view
  Widget get view => CasesQuizPage(title: title, page: page,
        model: Modular.args.data,
      );
}
