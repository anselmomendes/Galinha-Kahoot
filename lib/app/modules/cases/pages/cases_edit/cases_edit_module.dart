import 'package:galinha_karoot/app/modules/cases/pages/cases_edit/cases_edit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_edit/cases_edit_page.dart';

class CasesEditModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesEditController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CasesEditPage()),
      ];

  static Inject get to => Inject<CasesEditModule>.of();
}
