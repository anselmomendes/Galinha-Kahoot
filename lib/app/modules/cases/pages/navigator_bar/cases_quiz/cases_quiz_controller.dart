import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/cases/models/QuizModel.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/cases/repositories/quiz_repository.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_quiz_controller.g.dart';

class CasesQuizController = _CasesQuizControllerBase with _$CasesQuizController;

abstract class _CasesQuizControllerBase with Store {
  final QuizRepository quizRepository;
  final CasesRepository casesRepository;

  // Construtor (se modificar aqui, tem deve modificar 'cases_module')
  _CasesQuizControllerBase({this.casesRepository, this.quizRepository});

  void dispose() {
    casesRepository.dispose();
    quizRepository.dispose();
  }

  @observable
  ObservableStream<List<QuizModel>> quizList;

  @observable
  ObservableStream<List<ComponentModel>> casesPage;

  @observable
  List<QuizModel> quiz;

  @observable
  List<ComponentModel> cases;

  @observable
  bool editMode = false;

  // Chama a função para puxar as questões do caso
  @action
  getDocuments(String casesID, String page) async {
    quiz = await quizRepository.getDocuments(casesID, page);
  }

  // Deleta a questão
  @action
  delete(String casesID, String page, String questionID) {
    return quizRepository.deleteWidget(casesID, page, questionID);
  }

  // Cria uma questão
  @action
  create(QuizModel model) {
    return quizRepository.createWidget(model);
  }
}
