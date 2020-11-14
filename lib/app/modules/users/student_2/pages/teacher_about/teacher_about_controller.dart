import 'package:mobx/mobx.dart';

part 'teacher_about_controller.g.dart';

class TeacherAboutController = _TeacherAboutBase with _$TeacherAboutController;

abstract class _TeacherAboutBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
