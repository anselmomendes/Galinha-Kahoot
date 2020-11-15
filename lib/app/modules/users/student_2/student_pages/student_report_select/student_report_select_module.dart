import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_report_select/student_report_select_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_report_select/student_report_select_page.dart';
import 'package:flutter_modular/flutter_modular.dart';


class StudentReportSelectModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentReportSelectController(i.get<ClassRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => StudentReportSelectPage()),
      ];

  static Inject get to => Inject<StudentReportSelectModule>.of();
}
