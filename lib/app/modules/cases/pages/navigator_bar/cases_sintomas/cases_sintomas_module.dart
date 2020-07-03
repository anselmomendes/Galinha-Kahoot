import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_page.dart';
import 'package:galinha_karoot/app/modules/cases/view_model/cases_viewmodel.dart';

class CasesSintomasModule extends ModuleWidget {
  final CasesModel model;

  CasesSintomasModule({this.model});
  @override
  List<Bind> get binds => [
        Bind((i) => CasesSintomasController(i.get<CasesViewModel>())),
      ];

  static Inject get to => Inject<CasesSintomasModule>.of();

  @override
  Widget get view => CasesSintomasPage(
        model: Modular.args.data,
      );
}
