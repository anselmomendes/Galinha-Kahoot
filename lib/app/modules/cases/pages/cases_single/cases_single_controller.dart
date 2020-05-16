import 'package:mobx/mobx.dart';

part 'cases_single_controller.g.dart';

class CasesSingleController = _CasesSingleBase with _$CasesSingleController;

abstract class _CasesSingleBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
