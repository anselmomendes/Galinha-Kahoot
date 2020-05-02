import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/teacher_menu_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/teacher_menu_page.dart';

class TeacherMenuModule extends ModuleWidget {
  final bool showAppBar;

  TeacherMenuModule({this.showAppBar = false});

  @override
  List<Bind> get binds => [
        Bind((i) => TeacherMenuController()),
      ];

  @override
  List<Router> get routers => [
        Router('/student_login', child: (_, args) => TeacherMenuPage()),
      ];

  static Inject get to => Inject<TeacherMenuModule>.of();

  @override
  Widget get view => TeacherMenuPage(showAppBar: showAppBar);
}
