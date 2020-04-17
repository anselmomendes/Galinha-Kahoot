import 'package:mobx/mobx.dart';

part 'cases_exames_controller.g.dart';

class CasesExamesController = _CasesExamesBase with _$CasesExamesController;

abstract class _CasesExamesBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
