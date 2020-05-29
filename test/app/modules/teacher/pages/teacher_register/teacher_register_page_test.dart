import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_register/teacher_register_page.dart';

main() {
  testWidgets('TeacherRegisterPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(TeacherRegisterPage(title: 'TeacherRegister')));
    final titleFinder = find.text('TeacherRegister');
    expect(titleFinder, findsOneWidget);
  });
}
