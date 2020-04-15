import 'package:galinha_karoot/app/modules/class/services/class_service.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClassModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClassService()),
        Bind((i) => ClassRepository()),
      ];

  @override
  List<Router> get routers => [
        //Router('/', child: (_, args) => ClassPage()),
      ];

  static Inject get to => Inject<ClassModule>.of();
}
