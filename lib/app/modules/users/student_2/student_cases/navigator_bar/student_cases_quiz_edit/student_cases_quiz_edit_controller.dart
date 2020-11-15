import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_quiz_edit_controller.g.dart';

class StudentCasesQuizEditController = _StudentCasesQuizEditControllerBase
    with _$StudentCasesQuizEditController;

abstract class _StudentCasesQuizEditControllerBase with Store {
  final QuizRepository quizRepository;

  _StudentCasesQuizEditControllerBase(this.quizRepository);

  Future<bool> update(QuizModel model) {
    return quizRepository.updateWidget(model);
  }
  
}
