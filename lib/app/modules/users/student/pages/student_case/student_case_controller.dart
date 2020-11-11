import 'package:mobx/mobx.dart';

part 'student_case_controller.g.dart';

class StudentCaseController = _StudentCaseBase with _$StudentCaseController;

abstract class _StudentCaseBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
