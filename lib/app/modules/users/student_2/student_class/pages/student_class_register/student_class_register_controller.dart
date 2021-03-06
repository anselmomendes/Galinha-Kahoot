import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_class_register_controller.g.dart';

class StudentClassRegisterController = _StudentClassRegisterBase
    with _$StudentClassRegisterController;

abstract class _StudentClassRegisterBase with Store {
  final ClassRepository classRepository;
  final CasesRepository casesRepository;

  @observable
  ObservableStream<List<ClassModel>> classList;
  ObservableStream<List<CasesModel>> casesList;

  /* // Teste
  @observable
  var selectedCase;

  @action
  void mudarSelected(var newSelected) {
    selectedCase = newSelected;
  } */

  _StudentClassRegisterBase(this.classRepository, this.casesRepository) {
    getList();
  }

  @action
  getList() {
    classList = classRepository.get().asObservable();
    casesList = casesRepository.get().asObservable();
  }

  @action
  save(ClassModel model) {
    classRepository.save(model);
  }

  @action
  delete(ClassModel model) {
    classRepository.delete(model);
  }

  /* @observable
  int value = 0; */

  /* @action
  void increment() {
    value++;
  } */
}
