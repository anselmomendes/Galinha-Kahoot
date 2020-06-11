import 'package:mobx/mobx.dart';

part 'teacher_select_controller.g.dart';

class TeacherSelectController = _TeacherSelectBase
    with _$TeacherSelectController;

abstract class _TeacherSelectBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
