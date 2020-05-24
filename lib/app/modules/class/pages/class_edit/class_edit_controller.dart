import 'package:mobx/mobx.dart';

part 'class_edit_controller.g.dart';

class ClassEditController = _ClassEditControllerBase with _$ClassEditController;

abstract class _ClassEditControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
