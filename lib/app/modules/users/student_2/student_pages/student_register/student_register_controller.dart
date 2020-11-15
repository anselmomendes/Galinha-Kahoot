import 'package:mobx/mobx.dart';

part 'student_register_controller.g.dart';

class StudentRegisterController = _StudentRegisterBase
    with _$StudentRegisterController;

abstract class _StudentRegisterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
