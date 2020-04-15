import 'package:flutter_test/flutter_test.dart';

import 'package:galinha_karoot/app/modules/welcome/services/welcome_service.dart';

void main() {
  WelcomeService service;

  setUp(() {
    service = WelcomeService();
  });

  group('WelcomeService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<WelcomeService>());
    });
  });
}
