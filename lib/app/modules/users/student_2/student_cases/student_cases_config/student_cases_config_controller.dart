import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_config_controller.g.dart';

class StudentCasesConfigController = _StudentCasesConfigBase with _$StudentCasesConfigController;

abstract class _StudentCasesConfigBase with Store {
  final CasesRepository casesRepository;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _StudentCasesConfigBase(this.casesRepository) {
    getList();
  }

  @action
  getList() {
    casesList = casesRepository.get().asObservable();
  }

  @action
  update(CasesModel model) {
    casesRepository.updateCases(model);
  }

}
