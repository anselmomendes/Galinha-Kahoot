import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_login_controller.g.dart';

class StudentLoginController = _StudentLoginBase with _$StudentLoginController;

abstract class _StudentLoginBase with Store {}
