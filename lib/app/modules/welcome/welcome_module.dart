import 'package:galinha_karoot/app/modules/welcome/pages/welcome_page.dart';
import 'package:galinha_karoot/app/modules/welcome/services/welcome_service.dart';
import 'package:galinha_karoot/app/modules/welcome/repositories/welcome_repository.dart';
import 'package:galinha_karoot/app/modules/welcome/welcome_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WelcomeService()),
        Bind((i) => WelcomeRepository()),
        Bind((i) => WelcomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => WelcomePage()),
      ];

  static Inject get to => Inject<WelcomeModule>.of();
}
