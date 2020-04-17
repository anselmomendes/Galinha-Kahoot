import 'package:galinha_karoot/app/modules/student/pages/student_menu/student_menu_controller.dart';
import 'package:galinha_karoot/app/modules/student/pages/student_cadastro/student_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/student/pages/student_login/student_login_controller.dart';
import 'package:galinha_karoot/app/modules/student/pages/student_login/student_login_page.dart';
import 'package:galinha_karoot/app/modules/student/pages/student_menu/student_menu_page.dart';
import 'package:galinha_karoot/app/modules/student/services/student_service.dart';
import 'package:galinha_karoot/app/modules/student/repositories/student_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentMenuController()),
        Bind((i) => StudentLoginController()),
        Bind((i) => StudentService()),
        Bind((i) => StudentRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/student_login', child: (_, args) => StudentLoginPage()),
        Router('/student_menu', child: (_, args) => StudentMenuPage())
      ];

  static Inject get to => Inject<StudentModule>.of();
}
