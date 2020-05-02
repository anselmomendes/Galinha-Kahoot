import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_perfil/teacher_perfil_controller.dart';
import 'package:galinha_karoot/app/modules/teacher/teacher_module.dart';

void main() {
  initModule(TeacherModule());
  TeacherPerfilController teacherperfil;

  setUp(() {
    teacherperfil = TeacherModule.to.get<TeacherPerfilController>();
  });

  group('TeacherPerfilController Test', () {
    test("First Test", () {
      expect(teacherperfil, isInstanceOf<TeacherPerfilController>());
    });

    test("Set Value", () {
      expect(teacherperfil.value, equals(0));
      teacherperfil.increment();
      expect(teacherperfil.value, equals(1));
    });
  });
}
