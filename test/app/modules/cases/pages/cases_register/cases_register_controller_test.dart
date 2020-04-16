import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesRegisterController casesregister;

  setUp(() {
    casesregister = CasesModule.to.get<CasesRegisterController>();
  });

  group('CasesRegisterController Test', () {
    test("First Test", () {
      expect(casesregister, isInstanceOf<CasesRegisterController>());
    });

    test("Set Value", () {
      expect(casesregister.value, equals(0));
      casesregister.increment();
      expect(casesregister.value, equals(1));
    });
  });
}
