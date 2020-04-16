import 'package:mobx/mobx.dart';

part 'cases_home_controller.g.dart';

class CasesHomeController = _CasesHomeBase with _$CasesHomeController;

abstract class _CasesHomeBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
