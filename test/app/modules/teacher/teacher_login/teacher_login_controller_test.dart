import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/teacher/teacher_login/teacher_login_controller.dart';
import 'package:galinha_karoot/app/app_module.dart';

void main() {
  initModule(AppModule());
  TeacherLoginController teacherlogin;

  setUp(() {
    teacherlogin = AppModule.to.get<TeacherLoginController>();
  });

  group('TeacherLoginController Test', () {
    test("First Test", () {
      expect(teacherlogin, isInstanceOf<TeacherLoginController>());
    });

    test("Set Value", () {
      expect(teacherlogin.value, equals(0));
      teacherlogin.increment();
      expect(teacherlogin.value, equals(1));
    });
  });
}
