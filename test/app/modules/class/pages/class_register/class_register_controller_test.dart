import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_controller.dart';
import 'package:galinha_karoot/app/modules/class/class_module.dart';

void main() {
  initModule(ClassModule());
  ClassRegisterController classregister;

  setUp(() {
    classregister = ClassModule.to.get<ClassRegisterController>();
  });

  group('ClassRegisterController Test', () {
    test("First Test", () {
      expect(classregister, isInstanceOf<ClassRegisterController>());
    });

    test("Set Value", () {
      expect(classregister.value, equals(0));
      classregister.increment();
      expect(classregister.value, equals(1));
    });
  });
}
