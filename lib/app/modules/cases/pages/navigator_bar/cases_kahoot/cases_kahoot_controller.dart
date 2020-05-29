import 'package:galinha_karoot/app/modules/cases/store/cases_store.dart';
import 'package:mobx/mobx.dart';

part 'cases_kahoot_controller.g.dart';

class CasesKahootController = _CasesKahootBase with _$CasesKahootController;

abstract class _CasesKahootBase with Store {
  final CasesStore store;

  _CasesKahootBase(this.store);
}
