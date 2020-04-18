import 'package:galinha_karoot/app/modules/teacher/pages/teacher_area/teacher_area_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_area/teacher_area_page.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_cadastro/teacher_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_cadastro/teacher_cadastro_page.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_login/teacher_login_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_login/teacher_login_page.dart';
import 'package:galinha_karoot/app/modules/teacher/services/teacher_service.dart';
import 'package:galinha_karoot/app/modules/teacher/repositories/teacher_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TeacherModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherAreaController()),
        Bind((i) => TeacherCadastroController()),
        Bind((i) => TeacherLoginController()),
        Bind((i) => TeacherService()),
        Bind((i) => TeacherRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/teacher_login', child: (_, args) => TeacherLoginPage()),
        Router('/teacher_area', child: (_, args) => TeacherAreaPage()),
        Router('/teacher_cadastro', child: (_, args) => TeacherCadastroPage()),
      ];

  static Inject get to => Inject<TeacherModule>.of();
}
