import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_avaliacao/cases_avaliacao_page.dart';

main() {
  testWidgets('CasesAvaliacaoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CasesAvaliacaoPage(title: 'CasesAvaliacao')));
    final titleFinder = find.text('CasesAvaliacao');
    expect(titleFinder, findsOneWidget);
  });
}
