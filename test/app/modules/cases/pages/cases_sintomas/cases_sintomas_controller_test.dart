import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesSintomasController casessintomas;

  setUp(() {
    casessintomas = CasesModule.to.get<CasesSintomasController>();
  });

  group('CasesSintomasController Test', () {
    test("First Test", () {
      expect(casessintomas, isInstanceOf<CasesSintomasController>());
    });

    test("Set Value", () {
      expect(casessintomas.value, equals(0));
      casessintomas.increment();
      expect(casessintomas.value, equals(1));
    });
  });
}
