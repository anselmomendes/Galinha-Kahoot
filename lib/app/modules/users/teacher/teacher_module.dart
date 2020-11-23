import 'package:PeensA/app/modules/cases/repositories/quiz_repository.dart';
import 'package:PeensA/app/modules/cases/repositories/report_repository.dart';
import 'package:PeensA/app/modules/users/teacher/pages/teacher_relatorio/teacher_relatorio_page.dart';
import 'package:PeensA/app/modules/users/teacher/pages/teacher_relatorio_list/teacher_relatorio_list_page.dart';

import 'pages/teacher_relatorio_list/teacher_relatorio_list_controller.dart';
import 'pages/teacher_relatorio/teacher_relatorio_controller.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'pages/teacher_list_cases/teacher_list_cases_controller.dart';
import 'pages/teacher_perfil_edit/teacher_perfil_edit_controller.dart';
import 'pages/teacher_perfil/teacher_perfil_controller.dart';
import 'pages/teacher_about/teacher_about_controller.dart';
import 'pages/teacher_perfil_edit/teacher_perfil_edit_page.dart';
import 'pages/teacher_report_select/teacher_report_select_controller.dart';
import 'pages/teacher_report_select/teacher_report_select_page.dart';
import 'pages/teacher_root/teacher_root_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pages/teacher_list_cases/teacher_list_cases_page.dart';
import 'pages/teacher_menu/teacher_menu_controller.dart';
import 'pages/teacher_area/teacher_area_controller.dart';
import 'pages/teacher_area/teacher_area_page.dart';
import 'pages/teacher_cadastro/teacher_cadastro_controller.dart';
import 'pages/teacher_cadastro/teacher_cadastro_page.dart';
import 'pages/teacher_login/teacher_login_controller.dart';
import 'pages/teacher_login/teacher_login_page.dart';
import 'pages/teacher_menu/teacher_menu_page.dart';
import 'pages/teacher_root/teacher_root_page.dart';
import 'services/teacher_service.dart';
import 'repositories/teacher_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/teacher_about/teacher_about_page.dart';
import 'pages/teacher_perfil/teacher_perfil_page.dart';
import 'pages/teacher_register/teacher_register_controller.dart';
import 'pages/teacher_register/teacher_register_page.dart';
import 'pages/teacher_select/teacher_select_page.dart';

class TeacherModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherPerfilEditController(i.get<TeacherRepository>())),
        Bind((i) => TeacherPerfilController(
            i.get<TeacherRepository>(), i.get<TeacherRootController>())),
        Bind((i) => TeacherAboutController()),
        Bind((i) => TeacherRootController()),
        Bind((i) => TeacherReportSelectController(i.get<ClassRepository>())),
        Bind((i) => TeacherMenuController()),
        Bind((i) => TeacherAreaController()),
        Bind((i) => TeacherCadastroController()),
        Bind((i) => TeacherLoginController()),
        Bind((i) => TeacherService()),
        Bind((i) => TeacherRegisterController()),
        Bind((i) => TeacherRelatorioController()),
        Bind((i) => TeacherRelatorioListController()),
        Bind((i) => TeacherRepository(firestore: Firestore.instance)),
        Bind((i) => TeacherListCasesController(
            casesRepository: i.get<CasesRepository>())),

        //firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
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
            child: (_, args) => TeacherPerfilEditPage(
                  teacherModel: args.data,
                )),
        Router('/teacher_about',
            child: (_, args) => TeacherAboutPage(showAppBar: true)),
        Router('/teacher_perfil',
            child: (_, args) => TeacherPerfilPage(showAppBar: true)),
        Router('/teacher_report_select',
            child: (_, args) => TeacherReportSelectPage(showAppBar: true)),
        Router('/teacher_relatorio',
            child: (_, args) => TeacherRelatorioPage(
                  showAppBar: true,
                  model: args.data,
                )),
        Router('/teacher_relatorio_list',
            child: (_, args) => TeacherRelatorioListPage(
                  showAppBar: true,
                  listmodel: args.data,
                )),
      ];

  static Inject get to => Inject<TeacherModule>.of();
}
