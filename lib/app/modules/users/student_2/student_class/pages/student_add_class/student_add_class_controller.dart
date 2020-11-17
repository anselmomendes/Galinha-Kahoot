import 'package:galinha_karoot/app/modules/users/student/model/student_model.dart';
import 'package:galinha_karoot/app/modules/users/student/repositories/student_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_add_class_controller.g.dart';

class StudentAddClassController = _StudentAddClassBase
    with _$StudentAddClassController;

abstract class _StudentAddClassBase with Store {
  StudentRepository repo = StudentRepository();

  StudentAddClassController() {
    repo.getUserInfo();
  }

  StudentModel student;

  @observable
  String id;

  @action
  changeID(String value) => id = value;

  @action
  Future<void> getClassByAcessCode() async {
    print("Funfei 1");
    try {
      await repo.getClassByAcessCode(id, student);
    } catch (e) {
      print(e);
    }
  }
}
