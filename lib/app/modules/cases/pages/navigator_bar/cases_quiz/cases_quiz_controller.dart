import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_quiz_controller.g.dart';

class CasesQuizController = _CasesQuizControllerBase with _$CasesQuizController;

abstract class _CasesQuizControllerBase with Store {
  final CasesRepository casesRepository;

  _CasesQuizControllerBase(this.casesRepository);
  // final QuizRepository quizRepository;

  void dispose() {
    casesRepository.dispose();
    // quizRepository.dispose();
  }

  // @observable
  // ObservableStream<List<QuizModel>> quizList;
  
  @observable
  ObservableStream<List<ComponentModel>> casesPage;

  @observable
  List<ComponentModel> cases;

  @observable
  bool editMode = false;


  /* _CasesQuizControllerBase(this.quizRepository, this.casesRepository) {
    // getList();
  } */
  // _CasesQuizControllerBase({/* this.quizRepository,  */this.casesRepository});
  // _CasesQuizControllerBase({this.casesRepository});

  @action
  getDocuments(String casesID, String page) async {
    cases = await casesRepository.getDocuments(casesID, page);
  }

  @action
  delete(String casesID, String page) {
    return casesRepository.deleteWidget(casesID, page);
  }

  @action
  create(ComponentModel model) {
    return casesRepository.createWidget(model);
  }

  /* @action
  getList(/* String casesID */) {
    quizList = quizRepository.get().asObservable();
    // quizList = quizRepository.getQuiz(casesID).asObservable();
  } */

}
