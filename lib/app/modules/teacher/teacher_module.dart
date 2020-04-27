import 'package:galinha_karoot/app/modules/teacher/pages/teacher_report/teacher_report_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_list_cases/teacher_list_cases_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_list_cases/teacher_list_cases_page.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/teacher_menu_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_area/teacher_area_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_area/teacher_area_page.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_cadastro/teacher_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_cadastro/teacher_cadastro_page.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_login/teacher_login_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_login/teacher_login_page.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/teacher_menu_page.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_report/teacher_report_page.dart';
import 'package:galinha_karoot/app/modules/teacher/services/teacher_service.dart';
import 'package:galinha_karoot/app/modules/teacher/repositories/teacher_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TeacherModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherReportController(i.get<CasesRepository>())),
        //Bind((i) => TeacherReportController()),
        //Bind((i) => TeacherListCasesController()),
        Bind((i) => TeacherListCasesController(i.get<CasesRepository>())),
        Bind((i) => TeacherMenuController()),
        Bind((i) => TeacherAreaController()),
        Bind((i) => TeacherCadastroController()),
        Bind((i) => TeacherLoginController()),
        Bind((i) => TeacherService()),
        Bind((i) => TeacherRepository()), //firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('/teacher_login', child: (_, args) => TeacherLoginPage()),
        Router('/teacher_area', child: (_, args) => TeacherAreaPage()),
        Router('/teacher_cadastro', child: (_, args) => TeacherCadastroPage()),
        Router('/teacher_menu', child: (_, args) => TeacherMenuPage()),
        Router('/teacher_list_cases',
            child: (_, args) => TeacherListCasesPage()),
        Router('/teacher_report', child: (_, args) => TeacherReportPage())
      ];

  static Inject get to => Inject<TeacherModule>.of();
}
