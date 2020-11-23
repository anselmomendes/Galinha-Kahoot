import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/quiz_repository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/report_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/models/StudentModel.dart';
import 'package:mobx/mobx.dart';

part 'teacher_relatorio_controller.g.dart';

class TeacherRelatorioController = _TeacherRelatorioControllerBase
    with _$TeacherRelatorioController;

abstract class _TeacherRelatorioControllerBase with Store {
  ReportRepository reportRepository = ReportRepository();
  QuizRepository quizRepository = QuizRepository(firestore: null);

  @observable
  ObservableStream<List<StudentModel>> listStudents;

  @observable
  ObservableStream<List<QuizModel>> listquiz;

  double avaregeHits;
  double avaregeErrors;
  int size = 0;
  int hits = 0;
  int errors = 0;

  void getQuiz(String idCase) async {
    try {
      reportRepository.getQuiz(idCase);
    } catch (e) {
      print("Não foi possivel carregar o Quiz: $e");
    }
    loadQuiz();
  }

  void loadQuiz() {
    listquiz = reportRepository.outQuiz.asObservable();
  }

  void loadListStudents(String idCase) async {
    try {
      reportRepository.getStudentsWhoAnswered(idCase);
    } catch (e) {
      print("Não foi possivel carregar os alunos que responderam: $e");
    }
    getList();
  }

  void getList() async {
    listStudents = await reportRepository.ouStudents.asObservable();
  }

  void getAverage(List<StudentModel> list1, List<QuizModel> list2) {
    size = 0;
    hits = 0;
    errors = 0;

    size = list1.length;
    list1.forEach((student) {
      hits = (hits + student.hits);
      errors = (list2.length);
    });
    avaregeHits = (hits / size);
    avaregeErrors = (errors / size);
  }
}
