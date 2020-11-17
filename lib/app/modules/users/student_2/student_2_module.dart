import 'package:galinha_karoot/app/modules/users/student/pages/student_cadastro/student_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/student_cadastro/student_cadastro_page.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/student_login/student_login_controller.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/student_login/student_login_page.dart';
import 'package:galinha_karoot/app/modules/users/student/repositories/student_repository.dart';
import 'package:galinha_karoot/app/modules/users/student/services/student_service.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_add_class/student_add_class_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/studentclass_module.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_about/student_about_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_about/student_about_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_area/student_area_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_area/student_area_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_list_cases/student_list_cases_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_list_cases/student_list_cases_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_menu/student_menu_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_menu/student_menu_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_perfil/student_perfil_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_perfil/student_perfil_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_perfil_edit/student_perfil_edit_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_perfil_edit/student_perfil_edit_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_register/student_register_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_register/teacher_register_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_report_select/student_report_select_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_report_select/student_report_select_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_root/student_root_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_root/student_root_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_select/student_select_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';

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
        Bind((i) => StudentService()),
        Bind((i) => StudentRegisterController()),
        Bind((i) => StudentRepository(firestore: Firestore.instance)),
        Bind((i) => StudentListCasesController(
            casesRepository: i.get<CasesRepository>())),
      ];

  @override
  List<Router> get routers => [
        // Router('/student_2_menu', child: (_, args) => WelcomePage()),
        Router('/teacher_login', child: (_, args) => StudentLoginPage()),
        Router('/teacher_area', child: (_, args) => StudentAreaPage()),
        Router('/teacher_cadastro', child: (_, args) => StudentCadastroPage()),
        Router('/teacher_menu',
            child: (_, args) => StudentMenuPage(showAppBar: true)),
        Router('/teacher_list_cases',
            child: (_, args) => StudentListCasesPage(showAppBar: true)),
        Router('/student_root', child: (_, args) => StudentRootPage()),
        Router('/register', child: (_, args) => StudentRegisterPage()),
        Router('/teacher_select', child: (_, args) => StudentSelectPage()),
        Router('/teacher_perfil_edit',
            child: (_, args) => StudentPerfilEditPage(
                  teacherModel: args.data,
                )),
        Router('/teacher_about',
            child: (_, args) => StudentAboutPage(showAppBar: true)),
        Router('/teacher_perfil',
            child: (_, args) => StudentPerfilPage(showAppBar: true)),
        Router('/student_report_select',
            child: (_, args) => StudentReportSelectPage(showAppBar: true)),
           
      ];

  static Inject get to => Inject<Student2Module>.of();
}
