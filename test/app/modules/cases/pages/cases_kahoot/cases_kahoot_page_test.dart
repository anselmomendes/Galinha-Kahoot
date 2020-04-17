import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_kahoot/cases_kahoot_page.dart';

main() {
  testWidgets('CasesKahootPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CasesKahootPage(title: 'CasesKahoot')));
    final titleFinder = find.text('CasesKahoot');
    expect(titleFinder, findsOneWidget);
  });
}
