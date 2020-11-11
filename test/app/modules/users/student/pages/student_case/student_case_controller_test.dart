import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/users/student/pages/student_case/student_case_controller.dart';
import 'package:galinha_karoot/app/modules/users/student/student_module.dart';

void main() {
  initModule(StudentModule());
  StudentCaseController studentcase;

  setUp(() {
    studentcase = StudentModule.to.get<StudentCaseController>();
  });

  group('StudentCaseController Test', () {
    test("First Test", () {
      expect(studentcase, isInstanceOf<StudentCaseController>());
    });

    test("Set Value", () {
      expect(studentcase.value, equals(0));
      studentcase.increment();
      expect(studentcase.value, equals(1));
    });
  });
}
