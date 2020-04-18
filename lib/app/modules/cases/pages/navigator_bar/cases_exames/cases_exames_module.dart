import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_exames/cases_exames_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_exames/cases_exames_page.dart';

class CasesExamesModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesExamesController()),
      ];

  static Inject get to => Inject<CasesExamesModule>.of();

  @override
  Widget get view => CasesExamesPage();
}
