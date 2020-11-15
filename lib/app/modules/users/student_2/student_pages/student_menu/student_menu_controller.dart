import 'package:mobx/mobx.dart';

part 'student_menu_controller.g.dart';

class StudentMenuController = _StudentMenuControllerBase
    with _$StudentMenuController;

abstract class _StudentMenuControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
