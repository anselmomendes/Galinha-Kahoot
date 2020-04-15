import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/cases_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesController cases;

  setUp(() {
    cases = CasesModule.to.get<CasesController>();
  });

  group('CasesController Test', () {
    test("First Test", () {
      expect(cases, isInstanceOf<CasesController>());
    });

    test("Set Value", () {
      expect(cases.value, equals(0));
      cases.increment();
      expect(cases.value, equals(1));
    });
  });
}
