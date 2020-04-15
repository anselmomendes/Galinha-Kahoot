import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:galinha_karoot/app/modules/cases/repositories/cases_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  CasesRepository repository;
  MockClient client;

  setUp(() {
    repository = CasesRepository();
    client = MockClient();
  });

  group('CasesRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<CasesRepository>());
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
