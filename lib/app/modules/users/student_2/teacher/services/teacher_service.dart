import 'package:flutter_modular/flutter_modular.dart';
import '../models/TeacherModel.dart';
import '../repositories/interfaces/teacher_repositories_interfaces.dart';
import 'interfaces/teacher_services_interfaces.dart';

class TeacherService extends Disposable implements ITeacherServices {
  //dispose will be called automatically
  @override
  void dispose() {}

  final ITeacherRepository teacherRepository;
  TeacherService({this.teacherRepository});

  @override
  Future delete(TeacherModel model) {
    return teacherRepository.delete(model);
  }

  @override
  List<TeacherModel> getAll() {
    return teacherRepository.getAll();
  }

  @override
  Future<Stream<TeacherModel>> getAllStream() async {
    return teacherRepository.getAllStream();
  }

  @override
  Future save(TeacherModel model) {
    return teacherRepository.save(model);
  }

  @override
  Future create(TeacherModel model) {
    return teacherRepository.create(model);
  }
}
