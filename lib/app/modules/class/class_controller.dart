import 'package:mobx/mobx.dart';

part 'class_controller.g.dart';

class ClassController = _ClassBase with _$ClassController;

abstract class _ClassBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
