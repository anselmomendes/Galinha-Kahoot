import 'package:PeensA/app/modules/cases/models/QuizModel.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_relatorio_controller.g.dart';

class StudentCasesRelatorioController = _StudentCasesRelatorioBase
    with _$StudentCasesRelatorioController;

abstract class _StudentCasesRelatorioBase with Store {
  final Student2Repository student2Repository;

  @observable
  List<QuizModel> quizAnswered = [];

  @observable
  String hits;

  @observable
  ObservableStream<bool> access;

  _StudentCasesRelatorioBase({this.student2Repository});

  @action
  getQuizAnswer(String idCases) async {
    quizAnswered =
        await student2Repository.getQuizAnswer(idCases).asObservable();
  }

  @action
  getHits(String idCases) async {
    hits = await student2Repository.getHits(idCases).asObservable();
  }

  @action
  verifyQuiz(String idCases) async {
    try {
      await student2Repository.verifyAccessQuizReport(idCases);
    } catch (e) {
      print("Não foi possivel verificar: $e");
    }
    loadAccess();
  }

  @action
  loadAccess() {
    access = student2Repository.outAccessQuiz.asObservable(initialValue: true);
  }
}
