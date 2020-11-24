import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_edit/cases_edit_page.dart';

class CasesEditModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Bind((i) => CasesEditController(i.get<CasesViewModel>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CasesEditPage()),
      ];

  static Inject get to => Inject<CasesEditModule>.of();
}
