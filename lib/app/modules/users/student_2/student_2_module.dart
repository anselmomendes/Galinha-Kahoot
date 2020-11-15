import 'student_perfil/student_perfil_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_about/teacher_about_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_about/teacher_about_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_area/teacher_area_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_area/teacher_area_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_cadastro/teacher_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_cadastro/teacher_cadastro_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_list_cases/teacher_list_cases_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_list_cases/teacher_list_cases_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_login/teacher_login_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_login/teacher_login_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_menu/teacher_menu_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_menu/teacher_menu_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_perfil/student_perfil_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_perfil/student_perfil_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_perfil_edit/student_perfil_edit_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_perfil_edit/student_perfil_edit_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_register/teacher_register_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_register/teacher_register_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_report_select/teacher_report_select_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_report_select/teacher_report_select_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_root/teacher_root_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_root/teacher_root_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/pages/teacher_select/teacher_select_page.dart';

import 'package:galinha_karoot/app/modules/users/student_2/teacher/repositories/teacher_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/teacher/services/teacher_service.dart';

import 'repositories/student_2_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class Student2Module extends ChildModule {
  @override
  List<Bind> get binds => [
        $StudentPerfilController,
        Bind((i) => Student2Repository()),
        // Bind((i) => TeacherPerfilEditController(i.get<TeacherRepository>())),
        Bind((i) => TeacherPerfilEditController(i.get<Student2Repository>())),
        // Bind((i) => TeacherPerfilController(
        //     i.get<TeacherRepository>(), i.get<TeacherRootController>())),
        Bind((i) => StudentPerfilController(
            i.get<Student2Repository>(), i.get<TeacherRootController>())),
        Bind((i) => TeacherAboutController()),
        Bind((i) => TeacherRootController()),
        Bind((i) => TeacherReportSelectController(i.get<ClassRepository>())),
        Bind((i) => TeacherMenuController()),
        Bind((i) => TeacherAreaController()),
        Bind((i) => TeacherCadastroController()),
        Bind((i) => TeacherLoginController()),
        Bind((i) => TeacherService()),
        Bind((i) => TeacherRegisterController()),
        Bind((i) => TeacherRepository(firestore: Firestore.instance)),
        Bind((i) => TeacherListCasesController(
            casesRepository: i.get<CasesRepository>())),
      ];

  @override
  List<Router> get routers => [
        // Router('/student_2_menu', child: (_, args) => WelcomePage()),
        Router('/teacher_login', child: (_, args) => TeacherLoginPage()),
        Router('/teacher_area', child: (_, args) => TeacherAreaPage()),
        Router('/teacher_cadastro', child: (_, args) => TeacherCadastroPage()),
        Router('/teacher_menu',
            child: (_, args) => TeacherMenuPage(showAppBar: true)),
        Router('/teacher_list_cases',
            child: (_, args) => TeacherListCasesPage(showAppBar: true)),
        Router('/teacher_root', child: (_, args) => TeacherRootPage()),
        Router('/register', child: (_, args) => TeacherRegisterPage()),
        Router('/teacher_select', child: (_, args) => TeacherSelectPage()),
        Router('/teacher_perfil_edit',
            child: (_, args) => StudentPerfilEditPage(
                  teacherModel: args.data,
                )),
        Router('/teacher_about',
            child: (_, args) => TeacherAboutPage(showAppBar: true)),
        Router('/teacher_perfil',
            child: (_, args) => TeacherPerfilPage(showAppBar: true)),
        Router('/teacher_report_select',
            child: (_, args) => TeacherReportSelectPage(showAppBar: true)),
      ];

  static Inject get to => Inject<Student2Module>.of();
}
