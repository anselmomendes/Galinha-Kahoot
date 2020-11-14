import 'package:mobx/mobx.dart';

part 'teacher_cadastro_controller.g.dart';

class TeacherCadastroController = _TeacherCadastroBase
    with _$TeacherCadastroController;

abstract class _TeacherCadastroBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
