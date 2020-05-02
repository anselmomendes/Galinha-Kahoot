import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_about/teacher_about_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_about/teacher_about_page.dart';

class TeacherAboutModule extends ModuleWidget {
  final bool showAppBar;

  TeacherAboutModule({this.showAppBar = true});

  @override
  List<Bind> get binds => [
        Bind((i) => TeacherAboutController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<TeacherAboutModule>.of();

  @override
  Widget get view => TeacherAboutPage(showAppBar: showAppBar);
}
