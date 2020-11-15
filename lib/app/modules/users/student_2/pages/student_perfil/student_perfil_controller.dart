import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_root/teacher_root_controller.dart';

import '../../models/StudentModel.dart';
<<<<<<< HEAD:lib/app/modules/users/student_2/student_pages/student_perfil/student_perfil_controller.dart

=======
import '../teacher_root/teacher_root_controller.dart';
>>>>>>> 864e4a80f2e3a8511f8f2f80f27b06a817ceac22:lib/app/modules/users/student_2/pages/student_perfil/student_perfil_controller.dart
// import '../../repositories/teacher_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_perfil_controller.g.dart';

class StudentPerfilController = _StudentPerfilBase
    with _$StudentPerfilController;

abstract class _StudentPerfilBase with Store {
  // final TeacherRepository teacherRepository;
  final Student2Repository teacherRepository;
  final StudentRootController controllerRoot;

  @observable
  StudentModel teacherList;

<<<<<<< HEAD:lib/app/modules/users/student_2/student_pages/student_perfil/student_perfil_controller.dart
  _StudentPerfilBase(this.teacherRepository, this.controllerRoot){
=======
  _StudentPerfilBase(this.teacherRepository, this.controllerRoot) {
>>>>>>> 864e4a80f2e3a8511f8f2f80f27b06a817ceac22:lib/app/modules/users/student_2/pages/student_perfil/student_perfil_controller.dart
    getList();
  }

  @action
  getList() async {
    teacherList = await teacherRepository.getAllStream();
  }

  /* @action
  save(StudentModel model) {
    teacherRepository.save(model);
  }

  @action
  delete(StudentModel model) {
    teacherRepository.delete(model);
  }
*/

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
