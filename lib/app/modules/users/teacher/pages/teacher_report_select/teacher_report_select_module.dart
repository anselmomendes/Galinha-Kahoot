import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import '../../pages/teacher_report_select/teacher_report_select_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../pages/teacher_report_select/teacher_report_select_page.dart';

class TeacherReportSelectModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherReportSelectController(i.get<ClassRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => TeacherReportSelectPage()),
      ];

  static Inject get to => Inject<TeacherReportSelectModule>.of();
}
