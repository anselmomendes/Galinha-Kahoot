import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/student_cases_public/student_cases_public_page.dart';


class StudentCasesPublicModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => StudentCasesPublicController(i.get<CasesRepository>())),
      ];

  @override
  List<Router> get routers => [];

@override
  // TODO: implement view
  Widget get view => StudentCasesPublicPage();

  static Inject get to => Inject<StudentCasesPublicModule>.of();
}
