import 'package:PeensA/app/modules/users/student_2/models/StudentModel.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_add_class_controller.g.dart';

class StudentAddClassController = _StudentAddClassBase
    with _$StudentAddClassController;

abstract class _StudentAddClassBase with Store {
  Student2Repository repo = Student2Repository();

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
