import 'package:flutter_test/flutter_test.dart';

import 'package:galinha_karoot/app/modules/cases/services/cases_service.dart';

void main() {
  CasesService service;

  setUp(() {
    service = CasesService();
  });

  group('CasesService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<CasesService>());
    });
  });
}
