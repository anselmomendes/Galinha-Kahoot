import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/report_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'teacher_relatorio_list_controller.g.dart';

class TeacherRelatorioListController = _TeacherRelatorioListControllerBase
    with _$TeacherRelatorioListController;

abstract class _TeacherRelatorioListControllerBase with Store {}
