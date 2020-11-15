import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_register_controller.g.dart';

class StudentCasesRegisterController = _StudentCasesRegisterBase
    with _$StudentCasesRegisterController;

abstract class _StudentCasesRegisterBase with Store {
  final CasesRepository casesRepository;

  @observable
  ObservableStream<List<CasesModel>> casesList;

  _StudentCasesRegisterBase(this.casesRepository);

  @action
  Future<bool> save(CasesModel model) {
    return casesRepository.createCases(model);
  }
}
