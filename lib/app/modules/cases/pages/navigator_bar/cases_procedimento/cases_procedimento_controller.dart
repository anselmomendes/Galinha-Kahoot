import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_procedimento_controller.g.dart';

class CasesProcedimentoController = _CasesProcedimentoBase
    with _$CasesProcedimentoController;

abstract class _CasesProcedimentoBase with Store {
  final CasesStore store;

  _CasesProcedimentoBase(this.store);
}
