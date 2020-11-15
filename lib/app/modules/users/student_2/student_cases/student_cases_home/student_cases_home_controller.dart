import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_home_controller.g.dart';

class StudentCasesHomeController = _StudentCasesHomeBase with _$StudentCasesHomeController;

abstract class _StudentCasesHomeBase with Store {
  final pageViewController = PageController();

  final CasesViewModel casesViewModel;

  _StudentCasesHomeBase(this.casesViewModel);

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
