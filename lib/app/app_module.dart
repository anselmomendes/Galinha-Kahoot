import 'package:galinha_karoot/app/modules/cases/cases_module.dart';
import 'package:galinha_karoot/app/modules/class/class_module.dart';
import 'package:galinha_karoot/app/modules/student/student_module.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_module.dart';
import 'package:galinha_karoot/app/app_controller.dart';
import 'package:galinha_karoot/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/welcome/welcome_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: WelcomeModule()),
        Router(Modular.initialRoute, module: CasesModule()),
        Router(Modular.initialRoute, module: ClassModule()),
        Router(Modular.initialRoute, module: StudentModule()),
        Router(Modular.initialRoute, module: TeacherModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
