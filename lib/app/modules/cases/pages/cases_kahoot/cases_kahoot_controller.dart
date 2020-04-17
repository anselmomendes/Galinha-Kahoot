import 'package:mobx/mobx.dart';

part 'cases_kahoot_controller.g.dart';

class CasesKahootController = _CasesKahootBase with _$CasesKahootController;

abstract class _CasesKahootBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
