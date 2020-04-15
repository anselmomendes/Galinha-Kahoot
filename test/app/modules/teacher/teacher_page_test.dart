import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_page.dart';

main() {
  testWidgets('TeacherPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TeacherPage(title: 'Teacher')));
    final titleFinder = find.text('Teacher');
    expect(titleFinder, findsOneWidget);
  });
}
