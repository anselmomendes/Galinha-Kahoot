import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_procedimento/cases_procedimento_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesProcedimentoController casesprocedimento;

  setUp(() {
    casesprocedimento = CasesModule.to.get<CasesProcedimentoController>();
  });

  group('CasesProcedimentoController Test', () {
    test("First Test", () {
      expect(casesprocedimento, isInstanceOf<CasesProcedimentoController>());
    });

    test("Set Value", () {
      expect(casesprocedimento.value, equals(0));
      casesprocedimento.increment();
      expect(casesprocedimento.value, equals(1));
    });
  });
}
