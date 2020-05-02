import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/teacher/pages/teacher_perfil/teacher_perfil_page.dart';

main() {
  testWidgets('TeacherPerfilPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(TeacherPerfilPage(title: 'TeacherPerfil')));
    final titleFinder = find.text('TeacherPerfil');
    expect(titleFinder, findsOneWidget);
  });
}
