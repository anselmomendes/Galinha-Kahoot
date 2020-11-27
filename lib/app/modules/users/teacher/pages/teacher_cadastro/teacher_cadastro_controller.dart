import 'package:mobx/mobx.dart';

part 'teacher_cadastro_controller.g.dart';

class TeacherCadastroController = _TeacherCadastroBase
    with _$TeacherCadastroController;

abstract class _TeacherCadastroBase with Store {
  @observable
  String email;
  @observable
  String password;
  @observable
  String name;
  @observable
  String university;

  @computed
  bool get isValid {
    return validateEmail() == null &&
        validatePassword() == null &&
        validateName() == null &&
        validateUniversity() == null;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return "O email é obrigatorio";
    }
    if (!email.contains("@")) {
      return "Insira um email válido!";
    }
    return null;
  }

  String validatePassword() {
    if (password == null || password.isEmpty) {
      return "A senha é obrigatoria";
    }
    if (password.length < 6) {
      return "Sua senha deve conter no minimo 6 caracteres";
    }
    return null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O nome é obrigatorio";
    }
    return null;
  }

  String validateUniversity() {
    if (university == null || university.isEmpty) {
      return "Campo obrigatorio ";
    }
    return null;
  }

  @action
  changeEmail(String value) => email = value;
  @action
  changeName(String value) => name = value;
  @action
  changeUniversity(String value) => university = value;

  @action
  changePassword(String value) => password = value;
}
