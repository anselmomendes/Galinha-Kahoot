import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_exames/cases_exames_page.dart';

main() {
  testWidgets('CasesExamesPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CasesExamesPage(title: 'CasesExames')));
    final titleFinder = find.text('CasesExames');
    expect(titleFinder, findsOneWidget);
  });
}
