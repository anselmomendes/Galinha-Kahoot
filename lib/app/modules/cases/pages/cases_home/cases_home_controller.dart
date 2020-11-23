import 'package:flutter/material.dart';
import 'package:PeensA/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'cases_home_controller.g.dart';

class CasesHomeController = _CasesHomeBase with _$CasesHomeController;

abstract class _CasesHomeBase with Store {
  final pageViewController = PageController();

  final CasesViewModel casesViewModel;

  _CasesHomeBase(this.casesViewModel);

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
