import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:galinha_karoot/app/modules/teacher/teacher_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_module.dart';

void main() {
  initModule(TeacherModule());
  TeacherController teacher;

  setUp(() {
    teacher = TeacherModule.to.get<TeacherController>();
  });

  group('TeacherController Test', () {
    test("First Test", () {
      expect(teacher, isInstanceOf<TeacherController>());
    });

    test("Set Value", () {
      expect(teacher.value, equals(0));
      teacher.increment();
      expect(teacher.value, equals(1));
    });
  });
}
