import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_cadastro/teacher_cadastro_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_module.dart';

void main() {
  initModule(TeacherModule());
  TeacherCadastroController teachercadastro;

  setUp(() {
    teachercadastro = TeacherModule.to.get<TeacherCadastroController>();
  });

  group('TeacherCadastroController Test', () {
    test("First Test", () {
      expect(teachercadastro, isInstanceOf<TeacherCadastroController>());
    });

    test("Set Value", () {
      expect(teachercadastro.value, equals(0));
      teachercadastro.increment();
      expect(teachercadastro.value, equals(1));
    });
  });
}
