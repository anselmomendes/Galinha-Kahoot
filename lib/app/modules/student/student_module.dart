import 'package:galinha_karoot/app/modules/student/pages/student_page.dart';
import 'package:galinha_karoot/app/modules/student/services/student_service.dart';
import 'package:galinha_karoot/app/modules/student/repositories/student_repository.dart';
import 'package:galinha_karoot/app/modules/student/student_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentService()),
        Bind((i) => StudentRepository()),
        Bind((i) => StudentController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => StudentPage()),
      ];

  static Inject get to => Inject<StudentModule>.of();
}
