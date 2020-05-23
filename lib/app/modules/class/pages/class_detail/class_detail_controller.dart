import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'class_detail_controller.g.dart';

class ClassDetailController = _ClassDetailControllerBase
    with _$ClassDetailController;

abstract class _ClassDetailControllerBase with Store {
  final ClassRepository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;

  _ClassDetailControllerBase(this.classRepository){
    getList();
  }


  @action
  getList() {
    classList = classRepository.get().asObservable();
  }
  
}
