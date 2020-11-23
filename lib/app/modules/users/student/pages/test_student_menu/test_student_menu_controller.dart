import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/users/student/model/student_model.dart';
import 'package:PeensA/app/modules/users/student/repositories/student_repository.dart';
import 'package:mobx/mobx.dart';

class StudentMenuController with Store {
  StudentRepository repo = StudentRepository();

  StudentMenuController() {
    getUserInfo();
  }

  @observable
  StudentModel user;
  @observable
  ObservableStream<List<ClassModel>> classes;

  @action
  Future<void> getUserInfo() async {
    user = await repo.getUserInfo();
  }

  @action
  void getClasses() {
    repo.getClasses();
    classes = repo.outClasses.asObservable();
  }
}
