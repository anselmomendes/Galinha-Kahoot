import 'package:mobx/mobx.dart';

part 'student_cadastro_controller.g.dart';

class StudentCadastroController = _StudentCadastroBase
    with _$StudentCadastroController;

abstract class _StudentCadastroBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
