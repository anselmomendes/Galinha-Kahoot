import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';

import '../../models/StudentModel.dart';
// import '../../repositories/teacher_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_perfil_edit_controller.g.dart';

class StudentPerfilEditController = _StudentPerfilEditControllerBase
    with _$StudentPerfilEditController;

abstract class _StudentPerfilEditControllerBase with Store {
  // final TeacherRepository teacherRepository;
  final Student2Repository teacherRepository;

  @observable
  StudentModel teacherList;

  _StudentPerfilEditControllerBase(this.teacherRepository);
/*
  @action
  save(StudentModel model) {
    teacherRepository.save(model);
  }
*/
  /* @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } */
}
