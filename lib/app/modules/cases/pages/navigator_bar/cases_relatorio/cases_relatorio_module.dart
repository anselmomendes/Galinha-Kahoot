import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_page.dart';

class CasesRelatorioModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesRelatorioController()),
      ];

  static Inject get to => Inject<CasesRelatorioModule>.of();

  @override
  // TODO: implement view
  Widget get view => CasesRelatorioPage();
}
