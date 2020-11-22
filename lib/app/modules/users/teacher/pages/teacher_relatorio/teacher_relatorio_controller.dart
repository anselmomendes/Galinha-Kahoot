import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'teacher_relatorio_controller.g.dart';

@Injectable()
class TeacherRelatorioController = _TeacherRelatorioControllerBase
    with _$TeacherRelatorioController;

abstract class _TeacherRelatorioControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
