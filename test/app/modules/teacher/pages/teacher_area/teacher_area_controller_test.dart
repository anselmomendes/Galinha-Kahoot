import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_area/teacher_area_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_module.dart';

void main() {
  initModule(TeacherModule());
  TeacherAreaController teacherarea;

  setUp(() {
    teacherarea = TeacherModule.to.get<TeacherAreaController>();
  });

  group('TeacherAreaController Test', () {
    test("First Test", () {
      expect(teacherarea, isInstanceOf<TeacherAreaController>());
    });

    test("Set Value", () {
      expect(teacherarea.value, equals(0));
      teacherarea.increment();
      expect(teacherarea.value, equals(1));
    });
  });
}
