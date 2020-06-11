import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_select/teacher_select_page.dart';

main() {
  testWidgets('TeacherSelectPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(TeacherSelectPage(title: 'TeacherSelect')));
    final titleFinder = find.text('TeacherSelect');
    expect(titleFinder, findsOneWidget);
  });
}
