import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:mobx/mobx.dart';

part 'cases_store.g.dart';

class CasesStore = _CasesStoreBase with _$CasesStore;

abstract class _CasesStoreBase with Store {
  @observable
  CasesModel casesModel = CasesModel();

  @action
  setModel(CasesModel model) => casesModel = model;
}
