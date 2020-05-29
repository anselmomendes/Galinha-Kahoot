import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_anamnese_controller.g.dart';

class CasesAnamneseController = _CasesAnamneseBase
    with _$CasesAnamneseController;

abstract class _CasesAnamneseBase with Store {
  final CasesStore store;

  _CasesAnamneseBase(this.store);
}
