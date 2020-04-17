import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_exames/cases_exames_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesExamesController casesexames;

  setUp(() {
    casesexames = CasesModule.to.get<CasesExamesController>();
  });

  group('CasesExamesController Test', () {
    test("First Test", () {
      expect(casesexames, isInstanceOf<CasesExamesController>());
    });

    test("Set Value", () {
      expect(casesexames.value, equals(0));
      casesexames.increment();
      expect(casesexames.value, equals(1));
    });
  });
}
