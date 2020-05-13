import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_controller.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_page.dart';
import 'package:galinha_karoot/app/modules/class/services/class_service.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClassModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClassRegisterController(i.get<ClassRepository>(),i.get<CasesRepository>())),
        Bind((i) => ClassService()),
        Bind((i) => ClassRepository(firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('/class_register', child: (_, args) => ClassRegisterPage()),
        //Router('/class_list', child: (_, args) => ClassListPage()),
      ];

  static Inject get to => Inject<ClassModule>.of();
}
