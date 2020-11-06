import 'package:mobx/mobx.dart';

part 'student_add_case_controller.g.dart';

class StudentAddCaseController = _StudentAddCaseBase
    with _$StudentAddCaseController;

abstract class _StudentAddCaseBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
