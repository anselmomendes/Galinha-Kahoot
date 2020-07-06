import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_sintomas_controller.g.dart';

class CasesSintomasController = _CasesSintomasBase
    with _$CasesSintomasController;

abstract class _CasesSintomasBase with Store {
  final CasesRepository casesRepository;

  void dispose() {
    casesRepository.dispose();
  }

  @observable
  ObservableStream<List<ComponentModel>> casesPage;

  @observable
  bool editMode = false;

  _CasesSintomasBase({this.casesRepository}) {
    //getApresentacao('5Eg2Dv0erU37JCjQYoRI', 'apresentacao');
  }

  @action
  getApresentacao(String idCases) {
    casesPage = casesRepository.getApresentacao(idCases).asObservable();
  }

  @action
  delete() {
    return casesRepository.deleteWidget();
  }

  @action
  create(ComponentModel model) {
    return casesRepository.createWidget(model);
  }
}
