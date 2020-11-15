import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_report_select_controller.g.dart';

class StudentReportSelectController = _StudentReportSelectControllerBase
    with _$StudentReportSelectController;

abstract class _StudentReportSelectControllerBase with Store {
  final ClassRepository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;

  _StudentReportSelectControllerBase(this.classRepository){
    getList();

  }

  @action
  getList() {
    classList = classRepository.get().asObservable();
  }
  
}
