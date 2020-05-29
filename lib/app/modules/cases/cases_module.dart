import 'package:galinha_karoot/app/modules/cases/store/cases_store_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_single/cases_single_page.dart';
import 'package:galinha_karoot/app/modules/cases/services/cases_service.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CasesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesStoreController(i.get<CasesRepository>())),
        Bind((i) => CasesHomeController()),
        Bind((i) => CasesRegisterController(i.get<CasesRepository>())),
        Bind((i) => CasesService()),
      ];

  @override
  List<Router> get routers => [
        Router('/cases_home', child: (_, args) => CasesHomePage()),
        Router('/cases_register', child: (_, args) => CasesRegisterPage()),
        Router('/cases_single',
            child: (_, args) => CasesSinglePage(
                  casesModel: args.data,
                )),
      ];

  static Inject get to => Inject<CasesModule>.of();
}
