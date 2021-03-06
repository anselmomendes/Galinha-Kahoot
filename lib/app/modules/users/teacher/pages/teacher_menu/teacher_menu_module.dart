import 'package:flutter_modular/flutter_modular.dart';
import 'teacher_menu_controller.dart';
import 'teacher_menu_page.dart';

class TeacherMenuModule extends ChildModule {
  final bool showAppBar;

  TeacherMenuModule({this.showAppBar = false});

  @override
  List<Bind> get binds => [
        Bind((i) => TeacherMenuController()),
      ];

  @override
  List<Router> get routers => [
        Router('/',
            child: (_, args) => TeacherMenuPage(
                  showAppBar: false,
                )),
      ];

  static Inject get to => Inject<TeacherMenuModule>.of();
}
