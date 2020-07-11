import 'package:mobx/mobx.dart';

part 'teacher_area_controller.g.dart';

class TeacherAreaController = _TeacherAreaBase with _$TeacherAreaController;

abstract class _TeacherAreaBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
