import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_page.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_page.dart';

class StudentCasesSintomasModule extends ModuleWidget {
  String title;
  String page;
  final String idCase;

  StudentCasesSintomasModule({this.idCase, this.title, this.page});
  @override
  List<Bind> get binds => [];

  static Inject get to => Inject<StudentCasesSintomasModule>.of();

  @override
  Widget get view => StudentCasesSintomasPage(
        title: title,
        page: page,
        idCase: idCase,
      );
}
