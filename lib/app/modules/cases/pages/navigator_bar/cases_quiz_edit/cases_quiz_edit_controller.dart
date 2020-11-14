import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_quiz_edit_controller.g.dart';

class CasesQuizEditController = _CasesQuizEditControllerBase
    with _$CasesQuizEditController;

abstract class _CasesQuizEditControllerBase with Store {
  final QuizRepository quizRepository;

  _CasesQuizEditControllerBase(this.quizRepository);

  Future<bool> update(QuizModel model) {
    return quizRepository.updateWidget(model);
  }
  
}
