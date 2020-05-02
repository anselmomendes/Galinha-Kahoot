import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'teacher_report_controller.g.dart';

class TeacherReportController = _TeacherReportControllerBase
    with _$TeacherReportController;

abstract class _TeacherReportControllerBase with Store {
  final CasesRepository casesRepository;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  @observable
  int value = 0;

  _TeacherReportControllerBase(this.casesRepository) {
    getList();
  }

  @action
  void increment() {
    value++;
  }

  @action
  getList() {
    casesList = casesRepository.get().asObservable();
  }
}
