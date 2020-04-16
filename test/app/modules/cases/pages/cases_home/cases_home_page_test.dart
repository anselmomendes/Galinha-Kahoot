import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_home/cases_home_page.dart';

main() {
  testWidgets('CasesHomePage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(CasesHomePage(title: 'CasesHome')));
    final titleFinder = find.text('CasesHome');
    expect(titleFinder, findsOneWidget);
  });
}
