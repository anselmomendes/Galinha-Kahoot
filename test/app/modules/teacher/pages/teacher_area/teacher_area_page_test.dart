import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_area/teacher_area_page.dart';

main() {
  testWidgets('TeacherAreaPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(TeacherAreaPage(title: 'TeacherArea')));
    final titleFinder = find.text('TeacherArea');
    expect(titleFinder, findsOneWidget);
  });
}
