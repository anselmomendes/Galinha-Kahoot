import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_public/student_quiz_public/Splash_Screen.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_about/student_about_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_about/student_about_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_area/student_area_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_cadastro/student_cadastro_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_list_cases/student_list_cases_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_list_cases/student_list_cases_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_login/student_login_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_menu/student_menu_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_menu/student_menu_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_perfil/student_perfil_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_perfil/student_perfil_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_perfil_edit/student_perfil_edit_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_perfil_edit/student_perfil_edit_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_register/student_register_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_register/teacher_register_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_report_select/student_report_select_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_report_select/student_report_select_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_root/student_root_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_root/student_root_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_select/student_select_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:PeensA/app/modules/users/student_2/widgets/Splash_Screen.dart';

import 'repositories/student_2_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class Student2Module extends ChildModule {
  @override
  List<Bind> get binds => [
        //$StudentPerfilController,
        Bind((i) => Student2Repository()),
        Bind((i) => StudentPerfilEditController(i.get<Student2Repository>())),
        Bind((i) => StudentPerfilEditController(i.get<Student2Repository>())),
        Bind((i) => StudentPerfilController(
            i.get<Student2Repository>(), i.get<StudentRootController>())),
        Bind((i) => StudentPerfilController(
            i.get<Student2Repository>(), i.get<StudentRootController>())),
        Bind((i) => StudentAboutController()),
        Bind((i) => StudentRootController()),
        Bind((i) => StudentReportSelectController(i.get<ClassRepository>())),
        Bind((i) => StudentMenuController()),
        Bind((i) => StudentAreaController()),
        Bind((i) => StudentCadastroController()),
        Bind((i) => StudentLoginController()),
        Bind((i) => StudentRegisterController()),
        Bind((i) => StudentListCasesController(
            casesRepository: i.get<CasesRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/teacher_menu',
            child: (_, args) => StudentMenuPage(showAppBar: true)),
        Router('/student_list_cases',
            child: (_, args) => StudentListCasesPage(showAppBar: true)),
        Router('/student_root', child: (_, args) => StudentRootPage()),
        Router('/register', child: (_, args) => StudentRegisterPage()),
        Router('/teacher_select', child: (_, args) => StudentSelectPage()),
        Router('/teacher_perfil_edit',
            child: (_, args) => StudentPerfilEditPage(
                  teacherModel: args.data,
                )),
        Router('/student_about',
            child: (_, args) => StudentAboutPage(showAppBar: true)),
        Router('/student_perfil',
            child: (_, args) => StudentPerfilPage(showAppBar: true)),
        Router('/student_report_select',
            child: (_, args) => StudentReportSelectPage(showAppBar: true)),
        Router('/splash_screen_quiz',
            child: (_, args) => Splash(
                  list: args.data,
                )),
        Router('/splash_screen_quiz_public',
            child: (_, args) => SplashQuizPublic(
                  list: args.data,
                )),
      ];

  static Inject get to => Inject<Student2Module>.of();
}
