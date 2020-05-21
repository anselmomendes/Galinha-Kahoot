import 'package:mobx/mobx.dart';

part 'class_detail_controller.g.dart';

class ClassDetailController = _ClassDetailControllerBase
    with _$ClassDetailController;

abstract class _ClassDetailControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
