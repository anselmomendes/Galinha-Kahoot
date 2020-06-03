import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_kahoot/cases_kahoot_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_kahoot/cases_kahoot_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';

class CasesKahootModule extends ModuleWidget {
  @override
  List<Bind> get binds =>
      [Bind((i) => CasesKahootController(i.get<CasesRepository>()))];

  static Inject get to => Inject<CasesKahootModule>.of();

  @override
  Widget get view => CasesKahootPage(model: Modular.args.data);
}
