import 'package:mobx/mobx.dart';

part 'teacher_login_controller.g.dart';

class TeacherLoginController = _TeacherLoginBase with _$TeacherLoginController;

abstract class _TeacherLoginBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
