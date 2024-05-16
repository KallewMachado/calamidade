import 'package:coopartilhar/app/features/request_details/entities/status_details_entity.dart';

class StatusDetailsAdapter {
  static StatusDetailsEntity fromJson(Map<String, dynamic> map) {
    return StatusDetailsEntity(
      map['id'],
      Status.fromId(map['status_id']),
      map['description'],
    );
  }
}
