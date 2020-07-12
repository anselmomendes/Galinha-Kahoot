import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_update_controller.g.dart';

class CasesUpdateController = _CasesUpdateControllerBase
    with _$CasesUpdateController;

abstract class _CasesUpdateControllerBase with Store {
  final CasesRepository casesRepository;

  _CasesUpdateControllerBase(this.casesRepository);

  @observable
  ObservableStream<List<CasesModel>> casesList;

  @action
  Future<bool> update(CasesModel model) {
    return casesRepository.update(model);
  }
}
