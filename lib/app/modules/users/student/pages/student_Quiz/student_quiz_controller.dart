import 'package:mobx/mobx.dart';

part 'student_quiz_controller.g.dart';

class StudentQuizController = _StudentQuizControllerBase
    with _$StudentQuizController;

abstract class _StudentQuizControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
