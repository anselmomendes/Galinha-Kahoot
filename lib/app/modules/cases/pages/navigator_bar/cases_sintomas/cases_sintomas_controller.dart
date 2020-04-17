import 'package:mobx/mobx.dart';

part 'cases_sintomas_controller.g.dart';

class CasesSintomasController = _CasesSintomasBase
    with _$CasesSintomasController;

abstract class _CasesSintomasBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
