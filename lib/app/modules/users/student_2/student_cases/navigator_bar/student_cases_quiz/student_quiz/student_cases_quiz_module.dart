import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_quiz/student_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_quiz/student_quiz_page.dart';

class StudentQuizModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentQuizController()),
      ];

  static Inject get to => Inject<StudentQuizModule>.of();

  @override
  // TODO: implement routers
  List<Router> get routers => [
        Router('/quizpage',
            child: (_, args) => StudentQuizPage(
                  list: args.data,
                )),
      ];
}
