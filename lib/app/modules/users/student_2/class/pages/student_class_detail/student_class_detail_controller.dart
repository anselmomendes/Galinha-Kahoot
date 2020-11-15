import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_class_detail_controller.g.dart';

class StudentClassDetailController = _StudentClassDetailBase
    with _$StudentClassDetailController;

abstract class _StudentClassDetailBase with Store {
  final Student2Repository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;

  _StudentClassDetailBase(this.classRepository) {
    /*getList();*/
  }

  /*@action
  getList() {
    classList = classRepository.get().asObservable();
  }
  */
}
