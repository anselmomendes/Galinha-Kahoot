import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/student/pages/student_cadastro/student_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/student/student_module.dart';

void main() {
  initModule(StudentModule());
  StudentCadastroController studentcadastro;

  setUp(() {
    studentcadastro = StudentModule.to.get<StudentCadastroController>();
  });

  group('StudentCadastroController Test', () {
    test("First Test", () {
      expect(studentcadastro, isInstanceOf<StudentCadastroController>());
    });

    test("Set Value", () {
      expect(studentcadastro.value, equals(0));
      studentcadastro.increment();
      expect(studentcadastro.value, equals(1));
    });
  });
}
