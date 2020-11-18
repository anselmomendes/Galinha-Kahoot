import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_page.dart';

class StudentCasesRelatorioModule extends ModuleWidget {
  String title;
  String page;
  final CasesModel model;

  StudentCasesRelatorioModule({this.model, this.title, this.page});
  @override
  List<Bind> get binds => [
        Bind((i) => StudentCasesRelatorioController(student2Repository: i.get<Student2Repository>(), casesRepository: i.get<CasesRepository>())),
        
      ];

  static Inject get to => Inject<StudentCasesRelatorioModule>.of();

  @override
  // TODO: implement view
  Widget get view => StudentCasesRelatorioPage( 
        title: title,
        page: page,
        model: model,);
}
