import 'package:galinha_karoot/app/modules/class/models/StudentClassMeta.dart';
import 'package:galinha_karoot/app/modules/users/student/repositories/student_repository.dart';
import 'package:mobx/mobx.dart';

class StudentMenuController with Store { 

  StudentRepository repo = StudentRepository();

  @observable
  List<StudentClassMeta> classes = new List<StudentClassMeta>();

  @action
  void getClasses() async{
      if (this.repo != null)
        await this.repo.getClasses().then((value) => classes = value);      
  }

}
