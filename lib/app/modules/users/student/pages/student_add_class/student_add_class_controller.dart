import 'package:mobx/mobx.dart';

part 'student_add_class_controller.g.dart';

class StudentAddClassController = _StudentAddClassBase
    with _$StudentAddClassController;

abstract class _StudentAddClassBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
