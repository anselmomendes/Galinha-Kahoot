import 'package:mobx/mobx.dart';

part 'cases_avaliacao_controller.g.dart';

class CasesAvaliacaoController = _CasesAvaliacaoBase
    with _$CasesAvaliacaoController;

abstract class _CasesAvaliacaoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
