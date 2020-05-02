import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/class/pages/class_list/class_list_controller.dart';
import 'package:galinha_karoot/app/modules/class/class_module.dart';

void main() {
  initModule(ClassModule());
  ClassListController classlist;

  setUp(() {
    classlist = ClassModule.to.get<ClassListController>();
  });

  group('ClassListController Test', () {
    test("First Test", () {
      expect(classlist, isInstanceOf<ClassListController>());
    });

    test("Set Value", () {
      expect(classlist.value, equals(0));
      classlist.increment();
      expect(classlist.value, equals(1));
    });
  });
}
