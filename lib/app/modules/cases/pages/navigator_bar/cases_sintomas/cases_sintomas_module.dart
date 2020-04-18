import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_page.dart';

class CasesSintomasModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesSintomasController()),
      ];

  static Inject get to => Inject<CasesSintomasModule>.of();

  @override
  // TODO: implement view
  Widget get view => CasesSintomasPage();
}
