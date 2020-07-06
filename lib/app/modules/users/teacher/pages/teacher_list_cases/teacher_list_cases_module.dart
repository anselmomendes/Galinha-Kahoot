import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../pages/teacher_list_cases/teacher_list_cases_page.dart';

class TeacherListCasesModule extends ModuleWidget {
  final bool showAppBar;

  TeacherListCasesModule({this.showAppBar = true});

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<TeacherListCasesModule>.of();

  @override
  Widget get view => TeacherListCasesPage(showAppBar: showAppBar);
}
