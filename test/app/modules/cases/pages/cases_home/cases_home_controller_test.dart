import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesHomeController caseshome;

  setUp(() {
    caseshome = CasesModule.to.get<CasesHomeController>();
  });

  group('CasesHomeController Test', () {
    test("First Test", () {
      expect(caseshome, isInstanceOf<CasesHomeController>());
    });

    test("Set Value", () {
      expect(caseshome.value, equals(0));
      caseshome.increment();
      expect(caseshome.value, equals(1));
    });
  });
}
