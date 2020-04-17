import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_anamnese/anamnese_modeule_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  AnamneseModeuleRepository repository;
  MockClient client;

  setUp(() {
    repository = AnamneseModeuleRepository();
    client = MockClient();
  });

  group('AnamneseModeuleRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<AnamneseModeuleRepository>());
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
              (_) async => Response(data: {'title': 'Test'}, statusCode: 200));
      Map<String, dynamic> data = await repository.fetchPost(client);
      expect(data['title'], 'Test');
    });
  });
}
