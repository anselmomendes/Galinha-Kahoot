import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_config/cases_config_page.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';

import 'cases_config_controller.dart';

class CasesConfigModule extends ChildModule {
  @override
  List<Bind> get binds => [
     Bind((i) => CasesConfigController(i.get<CasesRepository>())),
      ];


  @override
  List<Router> get routers => [];

@override
  // TODO: implement view
  Widget get view => CasesConfigPage();

  static Inject get to => Inject<CasesConfigModule>.of();
}
