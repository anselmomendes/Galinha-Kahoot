import 'package:flutter_test/flutter_test.dart';

import 'package:galinha_karoot/app/modules/class/services/class_service.dart';

void main() {
  ClassService service;

  setUp(() {
    service = ClassService();
  });

  group('ClassService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<ClassService>());
    });
  });
}
