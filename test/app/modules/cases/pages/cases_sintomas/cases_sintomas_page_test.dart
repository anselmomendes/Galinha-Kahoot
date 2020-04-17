import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_sintomas/cases_sintomas_page.dart';

main() {
  testWidgets('CasesSintomasPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CasesSintomasPage(title: 'CasesSintomas')));
    final titleFinder = find.text('CasesSintomas');
    expect(titleFinder, findsOneWidget);
  });
}
