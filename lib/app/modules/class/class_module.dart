import 'package:PeensA/app/modules/class/pages/class_edit/class_edit_controller.dart';
import 'package:PeensA/app/modules/class/pages/class_detail/class_detail_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/class/pages/class_detail/class_detail_page.dart';
import 'package:PeensA/app/modules/class/pages/class_edit/class_edit_page.dart';
import 'package:PeensA/app/modules/class/pages/class_list/class_list_controller.dart';
import 'package:PeensA/app/modules/class/pages/class_list/class_list_page.dart';
import 'package:PeensA/app/modules/class/pages/class_register/class_register_controller.dart';
import 'package:PeensA/app/modules/class/pages/class_register/class_register_page.dart';
import 'package:PeensA/app/modules/class/services/class_service.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClassModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClassEditController(i.get<ClassRepository>(), i.get<CasesRepository>())),
        Bind((i) => ClassDetailController(i.get<ClassRepository>())),
        Bind((i) => ClassRegisterController(
            i.get<ClassRepository>(), i.get<CasesRepository>())),
        Bind((i) => ClassListController(i.get<ClassRepository>())),
        Bind((i) => ClassService()),
        Bind((i) => ClassRepository(firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('/class_register', child: (_, args) => ClassRegisterPage()),
        Router('/class_list', child: (_, args) => ClassListPage()),
        Router('/class_detail',
            child: (_, args) => ClassDetailPage(
                  classModel: args.data,
                )),
        Router('/class_edit', child: (_, args) => ClassEditPage(classModel: args.data,))
      ];

  static Inject get to => Inject<ClassModule>.of();
}
