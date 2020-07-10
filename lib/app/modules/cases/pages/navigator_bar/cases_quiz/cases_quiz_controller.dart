import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_quiz_controller.g.dart';

class CasesQuizController = _CasesQuizControllerBase with _$CasesQuizController;

abstract class _CasesQuizControllerBase with Store {
  final QuizRepository quizRepository;

  @observable
  ObservableStream<List<QuizModel>> quizList;

  _CasesQuizControllerBase(this.quizRepository) {
    getList();
  }

  @action
  getList(/* String casesID */) {
    quizList = quizRepository.get().asObservable();
    // quizList = quizRepository.getQuiz(casesID).asObservable();
  }

  @observable
  int value = 0;

  @action
  void increment() {
  }

}
