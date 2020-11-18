import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_relatorio_controller.g.dart';

class StudentCasesRelatorioController = _StudentCasesRelatorioBase
    with _$StudentCasesRelatorioController;

abstract class _StudentCasesRelatorioBase with Store {
  final CasesRepository casesRepository;
  final Student2Repository student2Repository;

  @observable
  bool editMode = false;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _StudentCasesRelatorioBase({this.casesRepository, this.student2Repository}) {
    getList();
  }

  @action
  getList() {
    casesList = casesRepository.get().asObservable();
  }

  @action
  save(CasesModel model) {
    casesRepository.save(model);
  }

  @action
  delete(CasesModel model) {
    casesRepository.delete(model);
  }
}
