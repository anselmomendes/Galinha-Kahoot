import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:PeensA/app/modules/cases/models/QuizModel.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_quiz_edit/cases_quiz_edit_page.dart';

class CasesQuizEditModule extends ModuleWidget {
  final QuizModel model;

  CasesQuizEditModule(this.model);
  
  @override
  List<Bind> get binds => [];

  /* @override
  List<Router> get routers => [
    Router('/', child: (_, args) => CasesQuizEditPage())
  ]; */

  static Inject get to => Inject<CasesQuizEditModule>.of();

  @override
  // TODO: implement view
  Widget get view => CasesQuizEditPage(model: model,);
}
