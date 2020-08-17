import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_quiz_edit/cases_quiz_edit_page.dart';

class CasesQuizEditModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => CasesQuizEditPage())
  ];

  static Inject get to => Inject<CasesQuizEditModule>.of();
}
