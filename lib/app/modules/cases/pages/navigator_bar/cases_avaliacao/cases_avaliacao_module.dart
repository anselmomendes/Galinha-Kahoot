import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_avaliacao/cases_avaliacao_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_avaliacao/cases_avaliacao_page.dart';

class CasesAvaliacaoModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesAvaliacaoController()),
      ];

  @override
  Widget get view => CasesAvaliacaoPage();

  static Inject get to => Inject<CasesAvaliacaoModule>.of();
}
