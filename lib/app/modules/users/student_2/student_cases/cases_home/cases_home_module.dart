import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_module.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/view_model/cases_viewmodel.dart';

class MenuModule extends ChildModule {
  @override
  List<Bind> get binds => [
        /*
    Bind((i) => CasesSintomasController(i.get<CasesViewModel>())),
    Bind((i) => CasesSintomasController(i.get<CasesViewModel>())),
    Bind((i) => CasesSintomasController(i.get<CasesViewModel>())),
    Bind((i) => CasesSintomasController(i.get<CasesViewModel>())),
    Bind((i) => CasesSintomasController(i.get<CasesViewModel>())),
    Bind((i) => CasesRelatorioController(i.get<CasesViewModel>())),
    
        Bind((i) => CasesSintomasController(
            i.get<CasesViewModel>(), i.get<CasesRepository>())),
      */
      ];

  @override
  List<Router> get routers => [
        Router('/sintomas', module: CasesSintomasModule()),
      ];
}
