import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/student/pages/student_cadastro/student_cadastro_page.dart';

main() {
  testWidgets('StudentCadastroPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(StudentCadastroPage(title: 'StudentCadastro')));
    final titleFinder = find.text('StudentCadastro');
    expect(titleFinder, findsOneWidget);
  });
}
