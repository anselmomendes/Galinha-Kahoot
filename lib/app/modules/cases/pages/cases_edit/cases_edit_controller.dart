import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/ImageRepository.dart';
import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';
import 'package:mobx/mobx.dart';

part 'cases_edit_controller.g.dart';

class CasesEditController = _CasesEditBase with _$CasesEditController;

abstract class _CasesEditBase with Store {
  final CasesRepository casesRepository;
  final ImageRepository imageRepository;

  _CasesEditBase({this.casesRepository, this.imageRepository});

  Future<bool> update(ComponentModel model) {
    return casesRepository.updateWidget(model);
  }

  
}
