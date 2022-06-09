import 'package:apitesting/fetch_books.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_book_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
  });

  tearDown(() {
    mockClient.close();
  });

  group('Fetch book API call test', () {
    test('Should return a list of books for http success call', () async {
      // Arrange
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
        (realInvocation) async => http.Response(
          '[{ "name": "The 5 Second Rule", "auther": "Mel Robbins"}]',
          200,
        ),
      );

      // Act & Assert
      expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
    });

    test('Should throw and exception when http call finished with an error',
        () {
      // Arrange
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
        (realInvocation) async => http.Response(
          'Not found',
          404,
        ),
      );

      // Act & Assert
      expect(fetchBooks(mockClient), throwsException);
    });
  });
}
