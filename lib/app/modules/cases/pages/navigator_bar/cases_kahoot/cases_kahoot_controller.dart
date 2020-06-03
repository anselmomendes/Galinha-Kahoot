import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_kahoot_controller.g.dart';

class CasesKahootController = _CasesKahootBase with _$CasesKahootController;

abstract class _CasesKahootBase with Store {
  final CasesRepository casesRepository;

  @observable
  bool editMode = false;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _CasesKahootBase(this.casesRepository) {
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
