import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';

import 'cases_public_controller.dart';
import 'cases_public_page.dart';

class CasesPublicModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CasesPublicController(i.get<CasesRepository>())),
      ];

  @override
  List<Router> get routers => [];

@override
  // TODO: implement view
  Widget get view => CasesPublicPage();

  static Inject get to => Inject<CasesPublicModule>.of();
}
