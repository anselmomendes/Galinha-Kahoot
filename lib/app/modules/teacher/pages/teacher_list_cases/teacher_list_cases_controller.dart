import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'teacher_list_cases_controller.g.dart';

class TeacherListCasesController = _TeacherListCasesControllerBase
    with _$TeacherListCasesController;

abstract class _TeacherListCasesControllerBase with Store {
  final CasesRepository casesRepository;
  final CasesStore store;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _TeacherListCasesControllerBase(this.casesRepository, this.store) {
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
