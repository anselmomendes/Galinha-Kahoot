import 'package:flutter/material.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';

import 'package:mobx/mobx.dart';

part 'student_cases_home_controller.g.dart';

class StudentCasesHomeController = _StudentCasesHomeBase
    with _$StudentCasesHomeController;

abstract class _StudentCasesHomeBase with Store {
  final pageViewController = PageController();
  final Student2Repository student2repository;

  _StudentCasesHomeBase(this.student2repository);

  @observable
  ObservableStream<CasesModel> caseModel;

  @action
  getCase(ClassModel classModel) async {
    print("Getcase foi chamada");
    try {
      student2repository.getCase(classModel);
    } catch (e) {
      print("Erro ao procutar caso! : $e");
    }
    getCaseController();
  }

  getCaseController() {
    caseModel = student2repository.outCase.asObservable();
  }
}
