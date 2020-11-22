import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'teacher_relatorio_list_controller.g.dart';

@Injectable()
class TeacherRelatorioListController = _TeacherRelatorioListControllerBase
    with _$TeacherRelatorioListController;

abstract class _TeacherRelatorioListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
