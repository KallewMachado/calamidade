import 'package:core_module/core_module.dart';
import 'package:core_module/src/client/dio/rest_client_dio_impl.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements DioForNative {}

void main() {
  late MockDio mockDio;
  late IRestClient restClient;

  setUp(
    () {
      mockDio = MockDio();
      restClient = RestClientDioImpl(dio: mockDio);
    },
  );

  group('Rest Client impl', () {
    test('should get with success', () async {
      when(
        () => mockDio.get(
          '',
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async => Response(
            data: 'test',
            requestOptions: RequestOptions(
              path: '',
            ),
            statusCode: 200,
          ));

      final result = await restClient.get(
        RestClientRequest(path: ''),
      );
      expect(result.statusCode, 200);
      expect(result.data, 'test');
    });

    test('should get with exception', () async {
      final request = RequestOptions(
        baseUrl: '',
      );

      when(
        () => mockDio.get(
          '',
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: request,
          response: Response(
            requestOptions: request,
            statusCode: 404,
            statusMessage: 'Error',
          ),
        ),
      );

      try {
        await restClient.get(RestClientRequest(path: ''));
      } on RestClientException catch (e) {
        expect(e.statusCode, 404);
      }
    });
  });
}
