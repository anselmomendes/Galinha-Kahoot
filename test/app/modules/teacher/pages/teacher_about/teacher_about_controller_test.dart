import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_about/teacher_about_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_module.dart';

void main() {
  initModule(TeacherModule());
  TeacherAboutController teacherabout;

  setUp(() {
    teacherabout = TeacherModule.to.get<TeacherAboutController>();
  });

  group('TeacherAboutController Test', () {
    test("First Test", () {
      expect(teacherabout, isInstanceOf<TeacherAboutController>());
    });

    test("Set Value", () {
      expect(teacherabout.value, equals(0));
      teacherabout.increment();
      expect(teacherabout.value, equals(1));
    });
  });
}
