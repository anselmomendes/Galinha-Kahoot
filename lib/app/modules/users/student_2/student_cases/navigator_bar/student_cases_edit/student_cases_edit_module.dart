import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_edit/cases_edit_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_edit/student_cases_edit_page.dart';

class StudentCasesEditModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Bind((i) => CasesEditController(i.get<CasesViewModel>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => StudentCasesEditPage()),
      ];

  static Inject get to => Inject<StudentCasesEditModule>.of();
}
