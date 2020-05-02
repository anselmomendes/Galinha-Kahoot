import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:galinha_karoot/app/modules/class/pages/class_list/class_list_page.dart';

main() {
  testWidgets('ClassListPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(ClassListPage(title: 'ClassList')));
    final titleFinder = find.text('ClassList');
    expect(titleFinder, findsOneWidget);
  });
}
