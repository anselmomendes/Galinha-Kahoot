import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_exames/cases_exames_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_exames/cases_exames_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';

class CasesExamesModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesExamesController(i.get<CasesRepository>())),
      ];

  static Inject get to => Inject<CasesExamesModule>.of();

  @override
  Widget get view => CasesExamesPage(model: Modular.args.data);
}
