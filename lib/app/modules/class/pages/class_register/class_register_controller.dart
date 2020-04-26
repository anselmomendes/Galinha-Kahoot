import 'package:mobx/mobx.dart';

part 'class_register_controller.g.dart';

class ClassRegisterController = _ClassRegisterBase
    with _$ClassRegisterController;

abstract class _ClassRegisterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
