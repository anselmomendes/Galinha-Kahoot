import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_anamnese/cases_anamnese_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesAnamneseController casesanamnese;

  setUp(() {
    casesanamnese = CasesModule.to.get<CasesAnamneseController>();
  });

  group('CasesAnamneseController Test', () {
    test("First Test", () {
      expect(casesanamnese, isInstanceOf<CasesAnamneseController>());
    });

    test("Set Value", () {
      expect(casesanamnese.value, equals(0));
      casesanamnese.increment();
      expect(casesanamnese.value, equals(1));
    });
  });
}
