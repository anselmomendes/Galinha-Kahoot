import 'package:mobx/mobx.dart';

part 'drawers_controller.g.dart';

class DrawersController = _DrawersBase with _$DrawersController;

abstract class _DrawersBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
