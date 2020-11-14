import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';

import '../../models/StudentModel.dart';
import '../../pages/teacher_root/teacher_root_controller.dart';
// import '../../repositories/teacher_repository.dart';
import 'package:mobx/mobx.dart';

part 'teacher_perfil_controller.g.dart';

class TeacherPerfilController = _TeacherPerfilBase
    with _$TeacherPerfilController;

abstract class _TeacherPerfilBase with Store {
  // final TeacherRepository teacherRepository;
  final Student2Repository teacherRepository;
  final TeacherRootController controllerRoot;


  @observable
  StudentModel teacherList;

  _TeacherPerfilBase(this.teacherRepository, this.controllerRoot){
    getList();
  }

  @action
  getList() async {
    teacherList = await teacherRepository.getAllStream();
  }

  @action
  save(StudentModel model) {
    teacherRepository.save(model);
  }

  @action
  delete(StudentModel model) {
    teacherRepository.delete(model);
  }

  
  @observable
  int value = 0;


  @action
  void increment() {
    value++;
  }

}
