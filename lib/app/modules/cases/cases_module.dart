import 'package:galinha_karoot/app/modules/cases/services/cases_service.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CasesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesService()),
        Bind((i) => CasesRepository()),
      ];

  @override
  List<Router> get routers => [
        //Router('/', child: (_, args) => CasesPage()),
      ];

  static Inject get to => Inject<CasesModule>.of();
}
