import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';
import 'package:galinha_karoot/app/modules/teacher/repositories/teacher_repository.dart';
import 'package:mobx/mobx.dart';

part 'teacher_perfil_controller.g.dart';

class TeacherPerfilController = _TeacherPerfilBase
    with _$TeacherPerfilController;

abstract class _TeacherPerfilBase with Store {
  final TeacherRepository teacherRepository;


  @observable
  TeacherModel teacherList;

  _TeacherPerfilBase(this.teacherRepository){
    getList();
  }

  @action
  getList() async {
    teacherList = await teacherRepository.getAllStream();
  }

  @action
  save(TeacherModel model) {
    teacherRepository.save(model);
  }

  delete(TeacherModel model) {
    teacherRepository.delete(model);
  }

  
  @observable
  int value = 0;


  @action
  void increment() {
    value++;
  }

}
