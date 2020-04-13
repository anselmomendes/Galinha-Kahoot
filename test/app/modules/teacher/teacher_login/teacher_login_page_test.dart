import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/teacher/teacher_login/teacher_login_page.dart';

main() {
  testWidgets('TeacherLoginPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(TeacherLoginPage(title: 'TeacherLogin')));
    final titleFinder = find.text('TeacherLogin');
    expect(titleFinder, findsOneWidget);
  });
}
