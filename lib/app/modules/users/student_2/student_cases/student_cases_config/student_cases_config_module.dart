import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_config/cases_config_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_config/student_cases_config_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_config/student_cases_config_page.dart';

import 'student_cases_config_controller.dart';

class StudentCasesConfigModule extends ChildModule {
  @override
  List<Bind> get binds => [
     Bind((i) => StudentCasesConfigController(i.get<CasesRepository>())),
      ];


  @override
  List<Router> get routers => [];

@override
  // TODO: implement view
  Widget get view => StudentCasesConfigPage();

  static Inject get to => Inject<StudentCasesConfigModule>.of();
}
