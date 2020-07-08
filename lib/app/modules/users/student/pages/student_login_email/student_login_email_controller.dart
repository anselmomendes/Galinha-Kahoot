import 'package:mobx/mobx.dart';

part 'student_login_email_controller.g.dart';

class StudentEmailLoginController = _StudentEmailLoginBase with _$StudentEmailLoginController;

abstract class _StudentEmailLoginBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
