import 'package:mobx/mobx.dart';

part 'student_select_controller.g.dart';

class StudentSelectController = _StudentSelectBase
    with _$StudentSelectController;

abstract class _StudentSelectBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
