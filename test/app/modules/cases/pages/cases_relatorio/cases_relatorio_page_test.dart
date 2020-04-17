import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_relatorio/cases_relatorio_page.dart';

main() {
  testWidgets('CasesRelatorioPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CasesRelatorioPage(title: 'CasesRelatorio')));
    final titleFinder = find.text('CasesRelatorio');
    expect(titleFinder, findsOneWidget);
  });
}
