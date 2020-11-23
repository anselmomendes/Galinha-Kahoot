import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

class CasesViewModel {
  final CasesRepository casesRepository;

  CasesViewModel({this.casesRepository});

/*
  @action
  Future<bool> deleteWidget() {
    return casesRepository.deleteWidget(casesPage.value.last);
  }*/

  save(CasesModel model) {
    //casesRepository.save(model);
  }

  delete(CasesModel model) {
    casesRepository.delete(model);
  }
}
