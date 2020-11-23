import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_page.dart';
import 'package:PeensA/app/modules/cases/repositories/report_repository.dart';

class CasesRelatorioModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesRelatorioController(i.get<ReportRepository>())),
      ];

  static Inject get to => Inject<CasesRelatorioModule>.of();

  @override
  // TODO: implement view
  Widget get view => CasesRelatorioPage(model: Modular.args.data);
}
