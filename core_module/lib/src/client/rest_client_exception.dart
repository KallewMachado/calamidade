import '../../core_module.dart';
import 'rest_client_http_message.dart';

class RestClientException extends BaseException
    implements RestClientHttpMessage {
  int? statusCode;
  dynamic error;
  RestClientResponse? response;

  RestClientException({
    required super.message,
    this.statusCode,
    required this.error,
    this.response,
    super.stackTracing,
  });
}
