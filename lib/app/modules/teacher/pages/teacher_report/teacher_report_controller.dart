import 'package:mobx/mobx.dart';

part 'teacher_report_controller.g.dart';

class TeacherReportController = _TeacherReportControllerBase
    with _$TeacherReportController;

abstract class _TeacherReportControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
