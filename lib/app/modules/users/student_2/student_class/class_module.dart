import 'package:galinha_karoot/app/modules/class/pages/class_edit/class_edit_controller.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_detail/class_detail_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_detail/class_detail_page.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_edit/class_edit_page.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_list/class_list_controller.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_list/class_list_page.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_controller.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_page.dart';
import 'package:galinha_karoot/app/modules/class/services/class_service.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_detail/student_class_detail_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_detail/student_class_detail_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_edit/student_class_edit_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_edit/student_class_edit_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_list/student_class_list_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_list/student_class_list_page.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_register/student_class_register_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_register/student_class_register_page.dart';

class ClassModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesRepository(firestore: Firestore.instance)),
        Bind((i) => StudentClassEditController(
            i.get<ClassRepository>(), i.get<CasesRepository>())),
        Bind((i) => StudentClassDetailController(i.get<ClassRepository>())),
        Bind((i) => StudentClassRegisterController(
            i.get<ClassRepository>(), i.get<CasesRepository>())),
        Bind((i) => StudentClassListController(i.get<Student2Repository>())),
        Bind((i) => StudentClassService()),
        Bind((i) => ClassRepository(firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('/class_list', child: (_, args) => StudentClassListPage()),
        Router('/class_detail',
            child: (_, args) => StudentClassDetailPage(
                  classModel: args.data,
                )),
      ];

  static Inject get to => Inject<ClassModule>.of();
}

class StudentClassService {}
