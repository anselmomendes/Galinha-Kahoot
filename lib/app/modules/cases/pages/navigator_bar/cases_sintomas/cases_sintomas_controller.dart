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
  List<ComponentModel> cases;

  @observable
  bool editMode = false;

  _CasesSintomasBase({this.casesRepository});

  @action
  getApresentacao(String casesID) async {
    cases = await casesRepository.getDocuments(casesID);
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
