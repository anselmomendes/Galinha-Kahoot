import 'package:PeensA/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_quiz/student_quiz_controller.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_public/student_quiz_public/student_quiz_public_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentQuizModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StudentQuizController()),
      ];

  static Inject get to => Inject<StudentQuizModule>.of();

  @override
  // TODO: implement routers
  List<Router> get routers => [
        Router('/quizpagePublic',
            child: (_, args) => StudentQuizPublicPage(
                  list: args.data,
                )),
      ];
}
