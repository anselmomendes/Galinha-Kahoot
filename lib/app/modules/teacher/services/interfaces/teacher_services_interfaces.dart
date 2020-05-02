import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';

abstract class ITeacherServices {
  Stream<List<TeacherModel>> getAllStream();
  List<TeacherModel> getAll();
  Future save(TeacherModel model);
  Future delete(TeacherModel model);
  Future create(TeacherModel model);
}
