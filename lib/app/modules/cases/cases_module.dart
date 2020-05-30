import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_single/cases_single_controller.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_single/cases_single_page.dart';
import 'package:galinha_karoot/app/modules/cases/services/cases_service.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../cases/store/cases_store.dart';
import 'pages/cases_edit/cases_edit_controller.dart';
import 'pages/cases_edit/cases_edit_page.dart';

class CasesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesHomeController()),
        Bind((i) => CasesRegisterController(i.get<CasesRepository>())),
        Bind((i) => CasesService()),
        Bind((i) => CasesSingleController(i.get<CasesStore>())),
        Bind((i) => CasesEditController()),
      ];

  @override
  List<Router> get routers => [
        Router('/cases_home',
            child: (_, args) => CasesHomePage(model: args.data)),
        Router('/cases_register', child: (_, args) => CasesRegisterPage()),
        Router('/cases_single', child: (_, args) => CasesSinglePage()),
        Router('/cases_edit', child: (_, args) => CasesEditPage()),
      ];

  static Inject get to => Inject<CasesModule>.of();
}
