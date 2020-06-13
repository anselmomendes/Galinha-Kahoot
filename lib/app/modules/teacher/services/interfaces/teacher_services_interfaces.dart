import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';

abstract class ITeacherServices {
  Future<Stream<TeacherModel>> getAllStream();
  List<TeacherModel> getAll();
  Future save(TeacherModel model);
  Future delete(TeacherModel model);
  Future create(TeacherModel model);
}
