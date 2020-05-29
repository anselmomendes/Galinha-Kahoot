import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_avaliacao_controller.g.dart';

class CasesAvaliacaoController = _CasesAvaliacaoBase
    with _$CasesAvaliacaoController;

abstract class _CasesAvaliacaoBase with Store {
  final CasesStore store;

  _CasesAvaliacaoBase(this.store);
}
