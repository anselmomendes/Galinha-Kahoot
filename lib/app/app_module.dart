import 'package:dio/dio.dart';
// import 'student_2_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PeensA/app/modules/cases/cases_module.dart';
import 'package:PeensA/app/modules/cases/repositories/report_repository.dart';
import 'package:PeensA/app/modules/class/class_module.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:PeensA/app/modules/users/student/student_module.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_quiz/student_cases_quiz_module.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/studentcase_module.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/studentclass_module.dart';
import 'package:PeensA/app/modules/users/teacher/teacher_module.dart';
import 'package:PeensA/app/app_controller.dart';
import 'package:PeensA/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:PeensA/app/modules/welcome/welcome_module.dart';
import 'modules/cases/repositories/cases_repository.dart';
import 'modules/cases/repositories/question_repository.dart';
import 'modules/cases/store/cases_store.dart';
import 'modules/cases/view_model/cases_viewmodel.dart';
import 'modules/users/student_2/student_2_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => Student2Repository(firestore: Firestore.instance)),
        Bind((i) => AppController()),
        Bind((i) => CasesRepository(firestore: Firestore.instance)),
        Bind((i) => QuestionRepository(firestore: Firestore.instance)),
        Bind((i) => CasesStore()),
        Bind((i) => ClassRepository(firestore: Firestore.instance)),
        Bind((i) => ReportRepository()),
        Bind((i) => CasesViewModel(casesRepository: i.get<CasesRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: WelcomeModule()),
        Router('/cases', module: CasesModule()),
        Router('/class', module: ClassModule()),
        Router('/student', module: StudentModule()),
        Router('/student_2', module: Student2Module()),
        Router('/teacher', module: TeacherModule()),
        Router('/student_class', module: StudentClassModule()),
        Router('/student_cases', module: StudentCaseModule()),
        Router('/student_quiz', module: StudentQuizModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
