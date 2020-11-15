import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_pages/student_root/teacher_root_controller.dart';

import '../../models/StudentModel.dart';

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

  _StudentPerfilBase(this.teacherRepository, this.controllerRoot){
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
