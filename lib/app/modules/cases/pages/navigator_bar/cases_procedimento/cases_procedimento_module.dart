import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_procedimento/cases_procedimento_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_procedimento/cases_procedimento_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';

class CasesProcedimentoModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesProcedimentoController(i.get<CasesRepository>())),
      ];

  static Inject get to => Inject<CasesProcedimentoModule>.of();

  @override
  Widget get view => CasesProcedimentoPage(model: Modular.args.data);
}