import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_kahoot/cases_kahoot_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_kahoot/cases_kahoot_page.dart';

class CasesKahootModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesKahootController()),
      ];

  static Inject get to => Inject<CasesKahootModule>.of();

  @override
  Widget get view => CasesKahootPage();
}
