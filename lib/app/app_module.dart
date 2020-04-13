import 'package:galinha_karoot/app/modules/teacher/teacher_cadastro/teacher_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_login/teacher_login_controller.dart';
import 'package:galinha_karoot/app/modules/welcome/welcome_controller.dart';
import 'package:galinha_karoot/app/app_controller.dart';
import 'package:galinha_karoot/app/app_widget.dart';
import 'package:galinha_karoot/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'modules/teacher/teacher_login/teacher_login_page.dart';
import 'modules/welcome/welcome_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherCadastroController()),
        Bind((i) => TeacherLoginController()),
        Bind((i) => WelcomeController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router(('/welcome'), child: (_, args) => WelcomePage()),
        Router(('/teacher_login'), child: (_, args) => TeacherLoginPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
