import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_avaliacao/cases_avaliacao_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_avaliacao/cases_avaliacao_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';

class CasesAvaliacaoModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesAvaliacaoController(i.get<CasesRepository>())),
      ];

  @override
  Widget get view => CasesAvaliacaoPage(model: Modular.args.data);

  static Inject get to => Inject<CasesAvaliacaoModule>.of();
}