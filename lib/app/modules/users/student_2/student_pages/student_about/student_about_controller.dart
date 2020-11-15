import 'package:mobx/mobx.dart';

part 'student_about_controller.g.dart';

class StudentAboutController = _StudentAboutBase with _$StudentAboutController;

abstract class _StudentAboutBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
