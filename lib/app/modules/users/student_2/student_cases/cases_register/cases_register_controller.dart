import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_register_controller.g.dart';

class CasesRegisterController = _CasesRegisterBase
    with _$CasesRegisterController;

abstract class _CasesRegisterBase with Store {
  final CasesRepository casesRepository;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _CasesRegisterBase(this.casesRepository);

  @action
  Future<bool> save(CasesModel model) {
    return casesRepository.createCases(model);
  }
}
