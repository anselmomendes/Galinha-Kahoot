import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import '../repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_store_controller.g.dart';

class CasesStoreController = _CasesStoreBase with _$CasesStoreController;

abstract class _CasesStoreBase with Store {
  final CasesRepository casesRepository;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _CasesStoreBase(this.casesRepository) {
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
