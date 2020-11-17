import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_page.dart';

class StudentCasesSintomasModule extends ModuleWidget {
  String title;
  String page;
  final CasesModel model;

  StudentCasesSintomasModule({this.model, this.title, this.page});
  @override
  List<Bind> get binds => [];

  static Inject get to => Inject<StudentCasesSintomasModule>.of();

  @override
  Widget get view => StudentCasesSintomasPage(title: title, page: page,
        model: model,
      );
}
