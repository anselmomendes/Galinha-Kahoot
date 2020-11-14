import 'package:mobx/mobx.dart';

part 'teacher_register_controller.g.dart';

class TeacherRegisterController = _TeacherRegisterBase
    with _$TeacherRegisterController;

abstract class _TeacherRegisterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
