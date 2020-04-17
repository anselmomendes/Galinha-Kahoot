import 'package:mobx/mobx.dart';

part 'cases_anamnese_controller.g.dart';

class CasesAnamneseController = _CasesAnamneseBase
    with _$CasesAnamneseController;

abstract class _CasesAnamneseBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
