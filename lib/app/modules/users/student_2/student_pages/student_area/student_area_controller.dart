import 'package:mobx/mobx.dart';

part 'student_area_controller.g.dart';

class StudentAreaController = _StudentAreaBase with _$StudentAreaController;

abstract class _StudentAreaBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
