import 'package:mobx/mobx.dart';

part 'cases_edit_controller.g.dart';

class CasesEditController = _CasesEditBase with _$CasesEditController;

abstract class _CasesEditBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
