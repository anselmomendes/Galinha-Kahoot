import 'package:mobx/mobx.dart';

part 'teacher_perfil_controller.g.dart';

class TeacherPerfilController = _TeacherPerfilBase
    with _$TeacherPerfilController;

abstract class _TeacherPerfilBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
