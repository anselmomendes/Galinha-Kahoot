import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';
import 'package:galinha_karoot/app/modules/teacher/repositories/teacher_repository.dart';
import 'package:mobx/mobx.dart';

part 'teacher_perfil_edit_controller.g.dart';

class TeacherPerfilEditController = _TeacherPerfilEditControllerBase
    with _$TeacherPerfilEditController;

abstract class _TeacherPerfilEditControllerBase with Store {
  final TeacherRepository teacherRepository;

  @observable
  TeacherModel teacherList;

  _TeacherPerfilEditControllerBase(this.teacherRepository);

  @action
  save(TeacherModel model) {
    teacherRepository.save(model);
  }

  /* @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } */
}
