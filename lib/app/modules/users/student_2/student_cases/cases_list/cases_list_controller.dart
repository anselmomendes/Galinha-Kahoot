import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cases_list_controller.g.dart';

class CasesListController = _CasesListControllerBase with _$CasesListController;

abstract class _CasesListControllerBase with Store {
  Student2Repository student2repository = Student2Repository();

  @observable
  ObservableStream<CasesModel> caseModel;

  @action
  getCase(ClassModel classModel) async {
    print("Getcase foi chamada : ${classModel.className}");
    try {
      student2repository.getCase(classModel);
    } catch (e) {
      print("Erro ao procutar caso! : $e");
    }
    getCaseController();
  }

  getCaseController() {
    caseModel = student2repository.outCase
        .asObservable(initialValue: CasesModel(id: ''));
  }
}
