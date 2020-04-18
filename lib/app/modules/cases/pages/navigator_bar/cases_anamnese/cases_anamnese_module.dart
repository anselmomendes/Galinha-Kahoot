import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_anamnese/cases_anamnese_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_anamnese/cases_anamnese_page.dart';

class CasesAnamneseModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesAnamneseController()),
      ];

  @override
  Widget get view => CasesAnamnesePage();

  static Inject get to => Inject<CasesAnamneseModule>.of();
}
