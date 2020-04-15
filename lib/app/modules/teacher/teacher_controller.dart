import 'package:mobx/mobx.dart';

part 'teacher_controller.g.dart';

class TeacherController = _TeacherBase with _$TeacherController;

abstract class _TeacherBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
