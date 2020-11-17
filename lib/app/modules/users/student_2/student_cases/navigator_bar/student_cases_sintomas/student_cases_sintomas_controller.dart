import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:galinha_karoot/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_sintomas_controller.g.dart';

class StudentCasesSintomasController = _StudentCasesSintomasBase
    with _$StudentCasesSintomasController;

abstract class _StudentCasesSintomasBase with Store {
  final Student2Repository student2repository;

  void dispose() {
    student2repository.dispose();
  }

  @observable
  ObservableStream<List<ComponentModel>> casesPage;

  @observable
  ObservableStream<List<ComponentModel>> cases;

  @observable
  bool editMode = false;

  _StudentCasesSintomasBase({this.student2repository});

  @action
  getDocuments(String casesID, String page) async {
    try {
      student2repository.getCaseComponent(casesID, page);
    } catch (e) {
      print("Erro ao chamar os componentes: $e");
    }
    getController();
  }

  @action
  getController() {
    cases = student2repository.outComponents.asObservable();
  }
}
