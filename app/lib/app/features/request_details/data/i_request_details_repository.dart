import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IRequestDetailsRepository {
  Future<Output<RequestDetailsEntity>> getRequestById(String id);
}
