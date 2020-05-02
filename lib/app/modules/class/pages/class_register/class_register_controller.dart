import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'class_register_controller.g.dart';

class ClassRegisterController = _ClassRegisterBase
    with _$ClassRegisterController;

abstract class _ClassRegisterBase with Store {
  final ClassRepository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;

  _ClassRegisterBase(this.classRepository) {
    getList();
  }

  @action
  getList() {
    classList = classRepository.get().asObservable();
  }

  @action
  save(ClassModel model) {
    classRepository.save(model);
  }

  @action
  delete(ClassModel model) {
    classRepository.delete(model);
  }


  /* @observable
  int value = 0; */


  /* @action
  void increment() {
    value++;
  } */
}
