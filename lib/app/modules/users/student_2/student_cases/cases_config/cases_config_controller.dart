import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_config_controller.g.dart';

class CasesConfigController = _CasesConfigBase with _$CasesConfigController;

abstract class _CasesConfigBase with Store {
  final CasesRepository casesRepository;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _CasesConfigBase(this.casesRepository) {
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
