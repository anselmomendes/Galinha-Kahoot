// import 'package:galinha_karoot/app/modules/common/AuthPage.dart';
import 'pages/student_login_email/student_login_email_page.dart';
import 'pages/student_login_options/student_menu_options_page.dart';
import 'pages/student_menu/student_menu_controller.dart';
import 'pages/student_cadastro/student_cadastro_controller.dart';
import 'pages/student_login/student_login_controller.dart';
import 'pages/student_login/student_login_page.dart';
import 'pages/student_menu/student_menu_page.dart';
import 'services/student_service.dart';
import 'repositories/student_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/student_cadastro/student_cadastro_page.dart';

class StudentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentMenuController()),
        Bind((i) => StudentLoginController()),
        Bind((i) => StudentCadastroController()),
        Bind((i) => StudentService()),
        Bind((i) => StudentRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/student_login', child: (_, args) => StudentLoginPage()),
        Router('/student_register', child: (_, args) => StudentCadastroPage()),
        Router('/student_login_email',
            child: (_, args) => StudentEmailLoginPage()),
        Router('/student_menu_options',
            child: (_, args) => StudentMenuOptionsPage()),
        Router('/student_menu', child: (_, args) => StudentMenuPage()),
      ];

  static Inject get to => Inject<StudentModule>.of();
}
