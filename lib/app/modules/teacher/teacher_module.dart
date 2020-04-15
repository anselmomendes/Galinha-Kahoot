import 'package:galinha_karoot/app/modules/teacher/services/teacher_service.dart';
import 'package:galinha_karoot/app/modules/teacher/repositories/teacher_repository.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_page.dart';

class TeacherModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherService()),
        Bind((i) => TeacherRepository()),
        Bind((i) => TeacherController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => TeacherPage()),
      ];

  static Inject get to => Inject<TeacherModule>.of();
}
