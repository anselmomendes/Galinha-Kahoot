import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/drawers/drawers_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_root/teacher_root_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_root/teacher_root_page.dart';

class TeacherRootModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherRootController()),
        Bind((i) => DrawersController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => TeacherRootPage()),
      ];

  static Inject get to => Inject<TeacherRootModule>.of();
}
