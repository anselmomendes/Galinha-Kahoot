import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/cases/view_model/cases_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'cases_sintomas_controller.g.dart';

class CasesSintomasController = _CasesSintomasBase
    with _$CasesSintomasController;

abstract class _CasesSintomasBase with Store {
  final CasesViewModel casesViewModel;

  @observable
  bool editMode = false;

  @observable
  List<ComponentModel> list;

  _CasesSintomasBase(this.casesViewModel);
}
