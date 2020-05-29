import 'package:galinha_karoot/app/modules/cases/pages/cases_root/cases_root_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_root/cases_root_page.dart';

class CasesRootModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesRootController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CasesRootPage()),
      ];

  static Inject get to => Inject<CasesRootModule>.of();
}
