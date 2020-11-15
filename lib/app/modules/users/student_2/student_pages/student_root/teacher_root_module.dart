import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_menu/drawers/drawers_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_root/teacher_root_controller.dart';
import '../../pages/teacher_menu/drawers/drawers_controller.dart';
import '../../pages/teacher_root/teacher_root_controller.dart';
import 'teacher_root_page.dart';

class TeacherRootModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentRootController()),
        Bind((i) => DrawersController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => StudentRootPage()),
      ];

  static Inject get to => Inject<StudentRootModule>.of();
}
