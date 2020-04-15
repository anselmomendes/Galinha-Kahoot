import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_page.dart';

main() {
  testWidgets('CasesPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CasesPage(title: 'Cases')));
    final titleFinder = find.text('Cases');
    expect(titleFinder, findsOneWidget);
  });
}
