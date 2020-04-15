import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_page.dart';

main() {
  testWidgets('ClassPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ClassPage(title: 'Class')));
    final titleFinder = find.text('Class');
    expect(titleFinder, findsOneWidget);
  });
}
