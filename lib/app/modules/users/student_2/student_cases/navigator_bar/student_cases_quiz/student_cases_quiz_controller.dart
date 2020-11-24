import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/cases/models/QuizModel.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_quiz_controller.g.dart';

class StudentCasesQuizController = _StudentCasesQuizControllerBase
    with _$StudentCasesQuizController;

abstract class _StudentCasesQuizControllerBase with Store {
  final Student2Repository student2repository;

  _StudentCasesQuizControllerBase({this.student2repository}) {
    print("Case controller iniciado");
  }

  void dispose() {
    student2repository.dispose();
  }

  @observable
  ObservableStream<List<QuizModel>> quizList;

  @observable
  ObservableStream<List<ComponentModel>> casesPage;

  @observable
  bool access;

  @observable
  List<ComponentModel> cases;

  @observable
  bool editMode = false;

  // Chama a função para puxar as questões do caso
  @action
  loadQuiz(String casesID, String page) async {
    try {
      student2repository.getQuiz(casesID, page);
    } catch (e) {
      print("Erro ao chamar os quiz: $e");
    }
    getQuiz();
  }

  @action
  getQuiz() {
    quizList = student2repository.outQuiz.asObservable();
  }

  Future verifyAccessQuiz(List<QuizModel> listquiz) async {
    try {
      access = await student2repository.verifyAccessQuiz(listquiz);
    } catch (e) {
      print("Não foi possivel verificar");
    }
  }
}
