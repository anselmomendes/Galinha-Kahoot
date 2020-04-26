import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_page.dart';

main() {
  testWidgets('ClassRegisterPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ClassRegisterPage(title: 'ClassRegister')));
    final titleFinder = find.text('ClassRegister');
    expect(titleFinder, findsOneWidget);
  });
}
