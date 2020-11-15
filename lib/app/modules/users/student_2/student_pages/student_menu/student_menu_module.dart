import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/student_menu/student_menu_page.dart';
import 'student_menu_controller.dart';
import 'student_menu_page.dart';

class StudentMenuModule extends ChildModule {
  final bool showAppBar;

  StudentMenuModule({this.showAppBar = false});

  @override
  List<Bind> get binds => [
        Bind((i) => StudentMenuController()),
      ];

  @override
  List<Router> get routers => [
        Router('/',
            child: (_, args) => StudentMenuPage(
                  showAppBar: false,
                )),
      ];

  static Inject get to => Inject<StudentMenuModule>.of();
}
