import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_public_controller.g.dart';

class StudentCasesPublicController = _StudentCasesPublicBase with _$StudentCasesPublicController;

abstract class _StudentCasesPublicBase with Store {
  final CasesRepository casesRepository;

 @observable
ObservableStream<List<CasesModel>> casesList;

  _StudentCasesPublicBase(this.casesRepository){
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
