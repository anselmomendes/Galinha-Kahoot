import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/store/cases_store_controller.dart';
import 'package:galinha_karoot/app/modules/cases/cases_module.dart';

void main() {
  initModule(CasesModule());
  CasesStoreController casesstore;

  setUp(() {
    casesstore = CasesModule.to.get<CasesStoreController>();
  });

  group('CasesStoreController Test', () {
    test("First Test", () {
      expect(casesstore, isInstanceOf<CasesStoreController>());
    });
  });
}
