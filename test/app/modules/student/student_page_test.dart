import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:galinha_karoot/app/modules/student/pages/student_page.dart';

main() {
  testWidgets('StudentPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(StudentPage(title: 'Student')));
    final titleFinder = find.text('Student');
    expect(titleFinder, findsOneWidget);
  });
}
