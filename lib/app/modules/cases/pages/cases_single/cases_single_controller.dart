import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_single_controller.g.dart';

class CasesSingleController = _CasesSingleBase with _$CasesSingleController;

abstract class _CasesSingleBase with Store {
  final CasesStore store;

  _CasesSingleBase(this.store);
}
