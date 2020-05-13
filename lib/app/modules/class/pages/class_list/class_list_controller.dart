import 'package:mobx/mobx.dart';

part 'class_list_controller.g.dart';

class ClassListController = _ClassListBase with _$ClassListController;

abstract class _ClassListBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
