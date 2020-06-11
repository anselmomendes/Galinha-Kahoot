import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_select/teacher_select_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_select/teacher_select_module.dart';

void main() {
  initModule(TeacherSelectModule());
  TeacherSelectController teacherselect;

  setUp(() {
    teacherselect = TeacherSelectModule.to.get<TeacherSelectController>();
  });

  group('TeacherSelectController Test', () {
    test("First Test", () {
      expect(teacherselect, isInstanceOf<TeacherSelectController>());
    });

    test("Set Value", () {
      expect(teacherselect.value, equals(0));
      teacherselect.increment();
      expect(teacherselect.value, equals(1));
    });
  });
}
