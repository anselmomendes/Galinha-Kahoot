import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_about/teacher_about_page.dart';

main() {
  testWidgets('TeacherAboutPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(TeacherAboutPage(title: 'TeacherAbout')));
    final titleFinder = find.text('TeacherAbout');
    expect(titleFinder, findsOneWidget);
  });
}
