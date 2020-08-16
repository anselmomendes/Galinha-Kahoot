import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
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


  /* @action
  getDocuments(String casesID, String page) async {
    cases = await casesRepository.getDocuments(casesID, page);
  } */

  // Chama a função para puxar as questões do caso
  @action
  getDocuments(String casesID, String page) async {
    quiz = await quizRepository.getDocuments(casesID, page);
  }

  /* @action
  delete(String casesID, String page) {
    return casesRepository.deleteWidget(casesID, page);
  } */

  // Deleta a questão
  @action
  delete(String casesID, String page) {
    return quizRepository.deleteWidget(casesID, page);
  }
  
  /* @action
  create(ComponentModel model) {
    return casesRepository.createWidget(model);
  } */

  // Cria uma questão
  @action
  create(QuizModel model) {
    return quizRepository.createWidget(model);
  }

  /* @action
  getList(/* String casesID */) {
    quizList = quizRepository.get().asObservable();
    // quizList = quizRepository.getQuiz(casesID).asObservable();
  } */

}
