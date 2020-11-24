import 'package:PeensA/app/modules/users/student_2/student_pages/student_root/student_root_controller.dart';
import 'package:PeensA/app/modules/users/student_2/teacher/repositories/teacher_repository.dart';
import 'package:PeensA/app/modules/users/teacher/models/TeacherModel.dart';

import 'package:PeensA/app/modules/users/student_2/models/StudentModel.dart';
import '../../student_pages/student_root/student_root_controller.dart';
import '../../repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_perfil_controller.g.dart';

class StudentPerfilController = _StudentPerfilBase
    with _$StudentPerfilController;

abstract class _StudentPerfilBase with Store {
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

  @action
  save(StudentModel model) {
   // teacherRepository.save(model);
  }

  @action
  delete(StudentModel model) {
   // teacherRepository.delete(model);
  }

  
  @observable
  int value = 0;


  @action
  void increment() {
    value++;
  }

}
