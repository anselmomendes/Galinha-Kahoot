import 'package:mobx/mobx.dart';

part 'student_controller.g.dart';

class StudentController = _StudentBase with _$StudentController;

abstract class _StudentBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
