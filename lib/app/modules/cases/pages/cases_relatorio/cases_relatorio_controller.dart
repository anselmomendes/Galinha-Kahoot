import 'package:mobx/mobx.dart';

part 'cases_relatorio_controller.g.dart';

class CasesRelatorioController = _CasesRelatorioBase
    with _$CasesRelatorioController;

abstract class _CasesRelatorioBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
