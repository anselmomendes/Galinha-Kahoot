import '../../models/TeacherModel.dart';
import '../../pages/teacher_root/teacher_root_controller.dart';
import '../../repositories/teacher_repository.dart';
import 'package:mobx/mobx.dart';

part 'teacher_perfil_controller.g.dart';

class TeacherPerfilController = _TeacherPerfilBase
    with _$TeacherPerfilController;

abstract class _TeacherPerfilBase with Store {
  final TeacherRepository teacherRepository;
  final TeacherRootController controllerRoot;


  @observable
  TeacherModel teacherList;

  _TeacherPerfilBase(this.teacherRepository, this.controllerRoot){
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

  @action
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
