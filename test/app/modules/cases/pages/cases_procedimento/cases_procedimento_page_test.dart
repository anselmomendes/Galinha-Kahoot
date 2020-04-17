import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_procedimento/cases_procedimento_page.dart';

main() {
  testWidgets('CasesProcedimentoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CasesProcedimentoPage(title: 'CasesProcedimento')));
    final titleFinder = find.text('CasesProcedimento');
    expect(titleFinder, findsOneWidget);
  });
}
