import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'class_list_controller.g.dart';

class ClassListController = _ClassListBase with _$ClassListController;

abstract class _ClassListBase with Store {
  final ClassRepository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;
  @observable
  ObservableStream<List<ClassModel>> classList2;

  _ClassListBase(this.classRepository) {
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
