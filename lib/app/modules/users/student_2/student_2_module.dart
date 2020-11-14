import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galinha_karoot/app/modules/users/student_2/teacher/pages/teacher_menu/teacher_menu_page.dart';

import 'repositories/student_2_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class Student2Module extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Student2Repository(firestore: Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
    // Router('/student_2_menu', child: (_, args) => WelcomePage()),
    Router('/teacher_menu',
            child: (_, args) => TeacherMenuPage(showAppBar: true)),
  ];

  static Inject get to => Inject<Student2Module>.of();
}
