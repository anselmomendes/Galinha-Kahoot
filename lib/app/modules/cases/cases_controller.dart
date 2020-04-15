import 'package:mobx/mobx.dart';

part 'cases_controller.g.dart';

class CasesController = _CasesBase with _$CasesController;

abstract class _CasesBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
