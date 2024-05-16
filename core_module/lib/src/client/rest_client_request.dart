import 'rest_client_http_message.dart';

class RestClientRequest implements RestClientHttpMessage {
  final String path;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;

  RestClientRequest({
    required this.path,
    this.data,
    this.queryParameters,
    this.headers,
  });
}
