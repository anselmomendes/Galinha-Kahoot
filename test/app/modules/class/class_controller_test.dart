import 'package:flutter_modular/flutter_modular_test.dart';    
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/class/class_controller.dart';
import 'package:galinha_karoot/app/modules/class/class_module.dart';

void main() {

  initModule(ClassModule());
  ClassController class;
  
  setUp(() {
      class = ClassModule.to.get<ClassController>();
  });

  group('ClassController Test', () {
    test("First Test", () {
      expect(class, isInstanceOf<ClassController>());
    });

    test("Set Value", () {
      expect(class.value, equals(0));
      class.increment();
      expect(class.value, equals(1));
    });
  });

}
  