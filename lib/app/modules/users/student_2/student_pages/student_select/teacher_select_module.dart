import '../../pages/teacher_select/teacher_select_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TeacherSelectModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TeacherSelectController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<TeacherSelectModule>.of();
}
