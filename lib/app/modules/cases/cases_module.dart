import 'package:galinha_karoot/app/modules/cases/pages/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_kahoot/cases_kahoot_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_procedimento/cases_procedimento_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_exames/cases_exames_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_avaliacao/cases_avaliacao_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_anamnese/cases_anamnese_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_anamnese/cases_anamnese_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_avaliacao/cases_avaliacao_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_exames/cases_exames_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_procedimento/cases_procedimento_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_relatorio/cases_relatorio_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_page.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_sintomas/cases_sintomas_page.dart';
import 'package:galinha_karoot/app/modules/cases/services/cases_service.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CasesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesRelatorioController()),
        Bind((i) => CasesProcedimentoController()),
        Bind((i) => CasesExamesController()),
        Bind((i) => CasesAvaliacaoController()),
        Bind((i) => CasesAnamneseController()),
        Bind((i) => CasesSintomasController()),
        Bind((i) => CasesHomeController()),
        Bind((i) => CasesRegisterController()),
        Bind((i) => CasesService()),
        Bind((i) => CasesRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/cases_home', child: (_, args) => CasesHomePage()),
        Router('/cases_register', child: (_, args) => CasesRegisterPage()),
        Router('/cases_sintomas', child: (_, args) => CasesSintomasPage()),
        Router('/cases_anamnese', child: (_, args) => CasesAnamnesePage()),
        Router('/cases_avaliacao', child: (_, args) => CasesAvaliacaoPage()),
        Router('/cases_exames', child: (_, args) => CasesExamesPage()),
        Router('/cases_procedimento',
            child: (_, args) => CasesProcedimentoPage()),
        Router('/cases_kahoot', child: (_, args) => CasesKahootPage()),
        Router('/cases_relatorio', child: (_, args) => CasesRelatorioPage()),
      ];

  static Inject get to => Inject<CasesModule>.of();
}
