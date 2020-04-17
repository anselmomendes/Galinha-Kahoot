import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_avaliacao/cases_avaliacao_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesAvaliacaoController casesavaliacao;

  setUp(() {
    casesavaliacao = CasesModule.to.get<CasesAvaliacaoController>();
  });

  group('CasesAvaliacaoController Test', () {
    test("First Test", () {
      expect(casesavaliacao, isInstanceOf<CasesAvaliacaoController>());
    });

    test("Set Value", () {
      expect(casesavaliacao.value, equals(0));
      casesavaliacao.increment();
      expect(casesavaliacao.value, equals(1));
    });
  });
}
