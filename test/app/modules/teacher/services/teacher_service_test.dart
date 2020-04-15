import 'package:flutter_test/flutter_test.dart';

import 'package:galinha_karoot/app/modules/teacher/services/teacher_service.dart';

void main() {
  TeacherService service;

  setUp(() {
    service = TeacherService();
  });

  group('TeacherService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<TeacherService>());
    });
  });
}
