import 'package:galinha_karoot/app/modules/class/services/class_service.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:galinha_karoot/app/modules/class/class_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/class/class_page.dart';

class ClassModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClassService()),
        Bind((i) => ClassRepository()),
        Bind((i) => ClassController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClassPage()),
      ];

  static Inject get to => Inject<ClassModule>.of();
}
