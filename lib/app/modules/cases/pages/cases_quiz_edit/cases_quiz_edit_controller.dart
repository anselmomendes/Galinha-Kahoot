import 'package:mobx/mobx.dart';

part 'cases_quiz_edit_controller.g.dart';

class CasesQuizEditController = _CasesQuizEditControllerBase
    with _$CasesQuizEditController;

abstract class _CasesQuizEditControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
