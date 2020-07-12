import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';

abstract class ICasesRepository {
  //fuções de casos
  Stream<List<CasesModel>> get();
  Future<bool> delete(CasesModel model);
  Future<bool> update(CasesModel model);
  Stream<List<CasesModel>> getForTeacher();
  Future<bool> createCases(CasesModel model);

  //funções de componentes
  Future<bool> createWidget(ComponentModel model);
  Future<bool> deleteWidget(String casesID, String page);
  Future<bool> updateWidget(ComponentModel model);
  Future<List<ComponentModel>> getDocuments(String idCases, String page);
}
