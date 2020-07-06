import 'package:mobx/mobx.dart';

part 'teacher_menu_controller.g.dart';

class TeacherMenuController = _TeacherMenuControllerBase
    with _$TeacherMenuController;

abstract class _TeacherMenuControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
