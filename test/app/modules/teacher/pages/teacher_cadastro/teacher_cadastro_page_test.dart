import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_cadastro/teacher_cadastro_page.dart';

main() {
  testWidgets('TeacherCadastroPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(TeacherCadastroPage(title: 'TeacherCadastro')));
    final titleFinder = find.text('TeacherCadastro');
    expect(titleFinder, findsOneWidget);
  });
}
