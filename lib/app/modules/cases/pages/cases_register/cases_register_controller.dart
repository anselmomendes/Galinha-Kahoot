import 'package:mobx/mobx.dart';

part 'cases_register_controller.g.dart';

class CasesRegisterController = _CasesRegisterBase
    with _$CasesRegisterController;

abstract class _CasesRegisterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
