import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesRelatorioController casesrelatorio;

  setUp(() {
    casesrelatorio = CasesModule.to.get<CasesRelatorioController>();
  });

  group('CasesRelatorioController Test', () {
    test("First Test", () {
      expect(casesrelatorio, isInstanceOf<CasesRelatorioController>());
    });

    test("Set Value", () {
      expect(casesrelatorio.value, equals(0));
      casesrelatorio.increment();
      expect(casesrelatorio.value, equals(1));
    });
  });
}
