import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

class CasesViewModel {
  final CasesRepository casesRepository;

  CasesViewModel({this.casesRepository});

  @observable
  ObservableStream<List<CasesModel>> casesList;

  @observable
  ObservableStream<List<ComponentModel>> casesPage;

  @action
  getList() {
    casesList = casesRepository.get().asObservable();
  }

  @action
  getApresentacoes(String idCases, String page) {
    casesPage = casesRepository.getCasesPage(idCases, page).asObservable();
  }

  @action
  Future<bool> updateWidget(ComponentModel model) {
    return casesRepository.updateWidget(model);
  }

  @action
  Future<bool> createWidget(ComponentModel model) {
    return casesRepository.createWidget(model);
  }

  @action
  Future<bool> deleteWidget() {
    return casesRepository.deleteWidget(casesPage.value.last);
  }

  save(CasesModel model) {
    casesRepository.save(model);
  }

  delete(CasesModel model) {
    casesRepository.delete(model);
  }
}
