import 'package:PeensA/app/modules/cases/repositories/report_repository.dart';
import 'package:PeensA/app/modules/users/student_2/models/StudentModel.dart';
import 'package:mobx/mobx.dart';

part 'cases_relatorio_controller.g.dart';

class CasesRelatorioController = _CasesRelatorioBase
    with _$CasesRelatorioController;

abstract class _CasesRelatorioBase with Store {
  final ReportRepository reportRepository;

  @observable
  ObservableStream<List<StudentModel>> listStudents;

  int avarege;
  int size;

  _CasesRelatorioBase(this.reportRepository);

  void loadList(String idCase) async {
    try {
      reportRepository.getStudentsWhoAnswered(idCase);
    } catch (e) {
      print("Não foi possivel carregar os alunos que responderam: $e");
    }
    getList();
  }

  void getList() {
    listStudents = reportRepository.ouStudents.asObservable();
  }

  double getAverage(List<StudentModel> list) {
    int hit;
    size = list.length;
    list.forEach((student) {
      hit = hit + student.hits;
    });
    return hit / size;
  }
}
