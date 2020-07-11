import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_edit_controller.g.dart';

class CasesEditController = _CasesEditBase with _$CasesEditController;

abstract class _CasesEditBase with Store {
  final CasesRepository casesRepository;

  _CasesEditBase(this.casesRepository);

  Future<bool> update(ComponentModel model) {
    return casesRepository.updateWidget(model);
  }
}
