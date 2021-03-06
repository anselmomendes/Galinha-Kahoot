import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/repositories/cases_repository.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/class/repositories/class_repository.dart';
import 'package:mobx/mobx.dart';

part 'class_edit_controller.g.dart';

class ClassEditController = _ClassEditControllerBase with _$ClassEditController;

abstract class _ClassEditControllerBase with Store {
  final ClassRepository classRepository;
  final CasesRepository casesRepository;

 

  @observable
  ObservableStream<List<ClassModel>> classList;
  ObservableStream<List<CasesModel>> casesList;

  _ClassEditControllerBase(this.classRepository, this.casesRepository) {
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
  int value = 0;

  @action
  void increment() {
    value++;
  } 
    @observable
  var status = ['Ativado', 'Desativado'];
  var itemSelecionado = 'Ativado';
  String currentStatus;
  */
}
