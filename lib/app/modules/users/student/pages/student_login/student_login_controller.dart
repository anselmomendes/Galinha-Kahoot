import 'package:mobx/mobx.dart';

part 'student_login_controller.g.dart';

class StudentLoginController = _StudentLoginBase with _$StudentLoginController;

abstract class _StudentLoginBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
