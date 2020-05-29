import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_exames_controller.g.dart';

class CasesExamesController = _CasesExamesBase with _$CasesExamesController;

abstract class _CasesExamesBase with Store {
  final CasesStore store;

  _CasesExamesBase(this.store);
}
