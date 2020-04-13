import 'package:galinha_karoot/app/modules/welcome/welcome_controller.dart';
import 'package:galinha_karoot/app/app_controller.dart';
import 'package:galinha_karoot/app/app_widget.dart';
import 'package:galinha_karoot/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WelcomeController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
