import 'package:mobx/mobx.dart';

part 'teacher_list_cases_controller.g.dart';

class TeacherListCasesController = _TeacherListCasesControllerBase
    with _$TeacherListCasesController;

abstract class _TeacherListCasesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
