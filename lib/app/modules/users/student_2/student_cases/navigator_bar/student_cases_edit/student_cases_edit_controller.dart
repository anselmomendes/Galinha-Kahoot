import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/ImageRepository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'student_cases_edit_controller.g.dart';

class StudentCasesEditController = _StudentCasesEditBase with _$StudentCasesEditController;

abstract class _StudentCasesEditBase with Store {
  final CasesRepository casesRepository;
  

  _StudentCasesEditBase({this.casesRepository});

  Future<bool> update(ComponentModel model) {
    return casesRepository.updateWidget(model);
  }

  
}
