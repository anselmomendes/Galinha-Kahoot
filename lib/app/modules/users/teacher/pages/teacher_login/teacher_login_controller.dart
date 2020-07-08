import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'teacher_login_controller.g.dart';

class TeacherLoginController = _TeacherLoginBase with _$TeacherLoginController;

abstract class _TeacherLoginBase with Store {}
