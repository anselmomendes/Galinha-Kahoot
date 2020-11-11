import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:galinha_karoot/app/modules/users/student/pages/student_case/student_case_page.dart';

main() {
  testWidgets('StudentCasePage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(StudentCasePage(title: 'StudentCase')));
    final titleFinder = find.text('StudentCase');
    expect(titleFinder, findsOneWidget);
  });
}
