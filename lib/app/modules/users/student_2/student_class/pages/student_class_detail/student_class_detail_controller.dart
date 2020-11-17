import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_class_detail_controller.g.dart';

class StudentClassDetailController = _StudentClassDetailControllerBase
    with _$StudentClassDetailController;

abstract class _StudentClassDetailControllerBase with Store {
  final Student2Repository student2repository;

  @observable
  ObservableStream<ClassModel> classModel;

  _StudentClassDetailControllerBase(this.student2repository);

  @action
  Future setClass(ClassModel model) async {
    try {
      student2repository.getClass(model);
    } catch (e) {
      print("Erro ao procurar turma: $e");
    }
    getClassforController();
  }

  getClassforController() {
    classModel = student2repository.outClass.asObservable();
    print("getClassforController foi chamada");
  }
}
