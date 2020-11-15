import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_list_cases/student_list_cases_page.dart';

class StudentListCasesModule extends ModuleWidget {
  final bool showAppBar;

 StudentListCasesModule({this.showAppBar = true});

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<StudentListCasesModule>.of();

  @override
  Widget get view => StudentListCasesPage(showAppBar: showAppBar);
}
