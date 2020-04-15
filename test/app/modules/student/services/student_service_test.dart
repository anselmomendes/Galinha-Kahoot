import 'package:flutter_test/flutter_test.dart';

import 'package:galinha_karoot/app/modules/student/services/student_service.dart';

void main() {
  StudentService service;

  setUp(() {
    service = StudentService();
  });

  group('StudentService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<StudentService>());
    });
  });
}
