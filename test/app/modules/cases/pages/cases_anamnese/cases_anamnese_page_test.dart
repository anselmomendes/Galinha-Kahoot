import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_anamnese/cases_anamnese_page.dart';

main() {
  testWidgets('CasesAnamnesePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CasesAnamnesePage(title: 'CasesAnamnese')));
    final titleFinder = find.text('CasesAnamnese');
    expect(titleFinder, findsOneWidget);
  });
}
