import 'package:mobx/mobx.dart';

part 'cases_root_controller.g.dart';

class CasesRootController = _CasesRootBase with _$CasesRootController;

abstract class _CasesRootBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
