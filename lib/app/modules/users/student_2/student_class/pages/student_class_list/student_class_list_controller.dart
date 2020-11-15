import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_class_list_controller.g.dart';

class StudentClassListController = _StudentClassListBase with _$StudentClassListController;

abstract class _StudentClassListBase with Store {
  final ClassRepository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;
  @observable
  ObservableStream<List<ClassModel>> classList2;

  _StudentClassListBase(this.classRepository) {
    getListTrue();
    getList();
  }

  @action
  getList() {
    classList = classRepository.get().asObservable();
  }

  @action
  getListTrue() {
    classList2 = classRepository.getForTeacher().asObservable();
  }

  @action
  save(ClassModel model) {
    classRepository.save(model);
  }

  @action
  delete(ClassModel model) {
    classRepository.delete(model);
  }

}
