import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';

abstract class ICasesRepository {
  Stream<List<CasesModel>> get();
  Future save(CasesModel model);
  Future delete(CasesModel model);
}
