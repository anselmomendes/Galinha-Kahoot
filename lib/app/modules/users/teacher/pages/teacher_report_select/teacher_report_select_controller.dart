import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'teacher_report_select_controller.g.dart';

class TeacherReportSelectController = _TeacherReportSelectControllerBase
    with _$TeacherReportSelectController;

abstract class _TeacherReportSelectControllerBase with Store {
  final ClassRepository classRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;

  _TeacherReportSelectControllerBase(this.classRepository){
    getList();

  }

  @action
  getList() {
    classList = classRepository.get().asObservable();
  }
  
}
