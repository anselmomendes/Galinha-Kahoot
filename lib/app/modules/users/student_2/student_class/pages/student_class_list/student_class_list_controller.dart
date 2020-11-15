import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_class_list_controller.g.dart';

class StudentClassListController = _StudentClassListBase
    with _$StudentClassListController;

abstract class _StudentClassListBase with Store {
  final Student2Repository student2repository;

  @observable
  ObservableStream<List<ClassModel>> classList;

  _StudentClassListBase(this.student2repository) {
    student2repository.getClasses();
  }

  @action
  getList() {
    classList = student2repository.outClasses.asObservable();
  }
}
