import 'package:core_module/core_module.dart';
import 'package:dio/dio.dart';

class DioAdapter {
  static RestClientException toClientException(DioException dioException) {
    return RestClientException(
      error: dioException.error,
      message: dioException.message ?? '',
      response: dioException.response == null
          ? null
          : toClientResponse(dioException.response!),
      statusCode: dioException.response?.statusCode,
    );
  }

  static DioException toDioException(RestClientException restClientException) {
    return DioException(
      requestOptions: RequestOptions(),
      error: restClientException.error,
      message: restClientException.message,
      response: restClientException.response == null
          ? null
          : toResponse(restClientException.response!),
    );
  }

  static RestClientRequest toClientRequest(RequestOptions request) {
    return RestClientRequest(
      path: request.path,
      headers: request.headers,
      queryParameters: request.queryParameters,
      data: request.data,
    );
  }

  static RequestOptions toRequestOptions(RestClientRequest restClientRequest) {
    return RequestOptions(
      path: restClientRequest.path,
      data: restClientRequest.data,
      queryParameters: restClientRequest.queryParameters,
      headers: restClientRequest.headers,
    );
  }

  static RestClientResponse toClientResponse(Response response) {
    return RestClientResponse(
      request: toClientRequest(response.requestOptions),
      message: response.statusMessage,
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  static Response toResponse(RestClientResponse restClientResponse) {
    final headers = restClientResponse.request.headers ?? {};
    final dioHeaders = <String, List<String>>{};

    for (var key in headers.keys) {
      dioHeaders[key] = [headers[key]];
    }

    return Response(
      requestOptions: toRequestOptions(restClientResponse.request),
      data: restClientResponse.data,
      headers: Headers.fromMap(dioHeaders),
      statusCode: restClientResponse.statusCode,
      statusMessage: restClientResponse.message,
    );
  }
}
