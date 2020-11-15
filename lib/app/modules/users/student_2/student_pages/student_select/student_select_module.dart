import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_select/student_select_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentSelectModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentSelectController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<StudentSelectModule>.of();
}
