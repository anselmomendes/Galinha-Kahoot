import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_public_controller.g.dart';

class CasesPublicController = _CasesPublicBase with _$CasesPublicController;

abstract class _CasesPublicBase with Store {
  final CasesRepository casesRepository;

 @observable
ObservableStream<List<CasesModel>> casesList;

  _CasesPublicBase(this.casesRepository){
    getList();
   }

    @action 
      getList() {
    casesList = casesRepository.getForTeacher().asObservable();
    }

@observable
  int value = 0;
 
  @action
  void increment() {
  }
}
