import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_kahoot/cases_kahoot_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesKahootController caseskahoot;

  setUp(() {
    caseskahoot = CasesModule.to.get<CasesKahootController>();
  });

  group('CasesKahootController Test', () {
    test("First Test", () {
      expect(caseskahoot, isInstanceOf<CasesKahootController>());
    });

    test("Set Value", () {
      expect(caseskahoot.value, equals(0));
      caseskahoot.increment();
      expect(caseskahoot.value, equals(1));
    });
  });
}
