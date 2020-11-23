import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_add_class/student_add_class_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_class_detail/student_class_detail_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_class_detail/student_class_detail_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_class_list/student_class_list_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_class_list/student_class_list_page.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_class_register/student_class_register_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_class_register/student_class_register_page.dart';

class StudentClassModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CasesRepository(firestore: Firestore.instance)),
        Bind((i) => StudentClassDetailController(i.get<Student2Repository>())),
        Bind((i) => StudentClassRegisterController(
            i.get<ClassRepository>(), i.get<CasesRepository>())),
        Bind((i) => StudentClassListController(i.get<Student2Repository>())),
        Bind((i) => StudentClassService()),
        Bind((i) => ClassRepository(firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('/student_class_register',
            child: (_, args) => StudentClassRegisterPage()),
        Router('/student_class_list',
            child: (_, args) => StudentClassListPage()),
        Router('/student_class_detail',
            child: (_, args) => StudentClassDetailPage(
                  classModel: args.data,
                )),
        Router('/student_add_class', child: (_, args) => StudentAddClassPage()),
      ];

  static Inject get to => Inject<StudentClassModule>.of();
}

class StudentClassService {}
