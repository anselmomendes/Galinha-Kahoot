import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';

import '../../models/StudentModel.dart';
// import '../../repositories/teacher_repository.dart';
import 'package:mobx/mobx.dart';

part 'teacher_perfil_edit_controller.g.dart';

class TeacherPerfilEditController = _TeacherPerfilEditControllerBase
    with _$TeacherPerfilEditController;

abstract class _TeacherPerfilEditControllerBase with Store {
  // final TeacherRepository teacherRepository;
  final Student2Repository teacherRepository;

  @observable
  StudentModel teacherList;

  _TeacherPerfilEditControllerBase(this.teacherRepository);
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
