import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'class_detail_controller.g.dart';

class StudentClassDetailController = _StudentClassDetailControllerBase
    with _$StudentClassDetailController;

abstract class _StudentClassDetailControllerBase with Store {
  final StudentClassRepository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;

  _StudentClassDetailControllerBase(this.classRepository){
    getList();
  }


  @action
  getList() {
    classList = classRepository.get().asObservable();
  }
  
}
