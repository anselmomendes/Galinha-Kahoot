import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_page.dart';

main() {
  testWidgets('CasesRegisterPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CasesRegisterPage(title: 'CasesRegister')));
    final titleFinder = find.text('CasesRegister');
    expect(titleFinder, findsOneWidget);
  });
}
