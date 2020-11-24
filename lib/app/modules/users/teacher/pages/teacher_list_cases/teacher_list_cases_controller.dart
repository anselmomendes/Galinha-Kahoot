import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'teacher_list_cases_controller.g.dart';

class TeacherListCasesController = _TeacherListCasesControllerBase
    with _$TeacherListCasesController;

abstract class _TeacherListCasesControllerBase with Store {
  final CasesRepository casesRepository;

  _TeacherListCasesControllerBase({this.casesRepository}) {
    getList();
  }

  @observable
  ObservableStream<List<CasesModel>> casesList;

  @action
  getList() {
    casesList = casesRepository.get().asObservable();
  }

  @action
  Future<bool> delete(CasesModel model) {
    return casesRepository.delete(model);
  }
}
