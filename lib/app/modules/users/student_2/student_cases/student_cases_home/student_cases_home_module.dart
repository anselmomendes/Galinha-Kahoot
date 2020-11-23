import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_module.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_module.dart';

class StudentMenuModule extends ChildModule {
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
        Router('/sintomas', module: StudentCasesSintomasModule()),
      ];
}
