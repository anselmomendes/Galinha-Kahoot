import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_relatorio_controller.g.dart';

class CasesRelatorioController = _CasesRelatorioBase
    with _$CasesRelatorioController;

abstract class _CasesRelatorioBase with Store {
  final CasesStore store;

  _CasesRelatorioBase(this.store);
}
