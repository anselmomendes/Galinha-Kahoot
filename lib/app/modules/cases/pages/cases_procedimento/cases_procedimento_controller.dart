import 'package:mobx/mobx.dart';

part 'cases_procedimento_controller.g.dart';

class CasesProcedimentoController = _CasesProcedimentoBase
    with _$CasesProcedimentoController;

abstract class _CasesProcedimentoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
