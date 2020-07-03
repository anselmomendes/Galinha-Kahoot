import 'package:galinha_karoot/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'teacher_list_cases_controller.g.dart';

class TeacherListCasesController = _TeacherListCasesControllerBase
    with _$TeacherListCasesController;

abstract class _TeacherListCasesControllerBase with Store {
  final CasesViewModel casesViewModel;

  _TeacherListCasesControllerBase({this.casesViewModel}) {
    casesViewModel.getList();
  }
}
