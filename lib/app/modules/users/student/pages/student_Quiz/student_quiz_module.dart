import 'student_quiz_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/student_Quiz/student_quiz_controller.dart';

class StudentQuizModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => StudentQuizController())];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<StudentQuizModule>.of();
}
